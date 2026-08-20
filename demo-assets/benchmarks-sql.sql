-- =====================================================================
-- SYNTHETIC TRAINING DATA — Copilot Studio workshop, session 2.3
-- Stand-up script for the "benchmark database" demonstrated on screen.
-- Works on Azure SQL Database (free tier) or SQL Server 2019+.
--
-- Everything here is fictional. No real index levels, no real returns.
-- =====================================================================

IF OBJECT_ID('dbo.Benchmark', 'U') IS NOT NULL DROP TABLE dbo.Benchmark;
GO

CREATE TABLE dbo.Benchmark (
    benchmark_id    INT IDENTITY(1,1) PRIMARY KEY,
    benchmark_name  NVARCHAR(120)  NOT NULL,
    return_1y       DECIMAL(6,2)   NOT NULL,
    return_3y       DECIMAL(6,2)   NOT NULL,
    return_5y       DECIMAL(6,2)   NOT NULL,
    as_of           DATE           NOT NULL
);
GO

INSERT INTO dbo.Benchmark (benchmark_name, return_1y, return_3y, return_5y, as_of) VALUES
    (N'CRISIL Hybrid 35+65 Aggressive Index', 12.80, 13.10, 11.70, '2026-06-30'),
    (N'CRISIL Composite Bond Fund Index',      7.40,  6.90,  6.60, '2026-06-30'),
    (N'Nifty 50 TRI',                         16.10, 17.20, 15.40, '2026-06-30');
GO

-- ---------------------------------------------------------------------
-- Rule from slide 2.3: the agent never writes the query.
-- It calls a parameterised stored procedure and receives one typed row.
-- ---------------------------------------------------------------------
CREATE OR ALTER PROCEDURE dbo.usp_GetBenchmarkReturns
    @benchmark_name NVARCHAR(120)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT TOP (1)
        benchmark_name,
        return_1y,
        return_3y,
        return_5y,
        as_of
    FROM dbo.Benchmark
    WHERE benchmark_name = @benchmark_name;
END;
GO

-- ---------------------------------------------------------------------
-- The numbers boundary, enforced in the database.
-- Excess return is arithmetic, so a system computes it — never the model.
-- The fund return is passed in because it comes from the factsheet.
-- ---------------------------------------------------------------------
CREATE OR ALTER PROCEDURE dbo.usp_GetExcessReturn
    @benchmark_name  NVARCHAR(120),
    @fund_return_3y  DECIMAL(6,2)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT TOP (1)
        benchmark_name,
        @fund_return_3y                       AS fund_return_3y,
        return_3y                             AS benchmark_return_3y,
        CAST(@fund_return_3y - return_3y AS DECIMAL(6,2)) AS excess_return_3y,
        as_of
    FROM dbo.Benchmark
    WHERE benchmark_name = @benchmark_name;
END;
GO

-- Expected on the day:
--   EXEC dbo.usp_GetBenchmarkReturns N'CRISIL Hybrid 35+65 Aggressive Index';
--     -> 12.80 | 13.10 | 11.70 | 2026-06-30
--   EXEC dbo.usp_GetExcessReturn    N'CRISIL Hybrid 35+65 Aggressive Index', 15.60;
--     -> fund 15.60 | benchmark 13.10 | excess 2.50
