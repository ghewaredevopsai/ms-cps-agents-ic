# Copilot Studio Workshop — Investment Consulting

**Client:** an enterprise **Investment Consulting** team — asset-owner / pension-fund solutions, with an internal GPT tool already in use.

**Engagement:** senior-led, 1-day (8 hr) hands-on **Microsoft Copilot Studio** workshop.
**Delivery date:** **27 August 2026** (Thursday), 09:00 – 18:00.
**Format:** in-person Bangalore for 30, hybrid for 5 joining online.
**Audience:** 35 participants, mixed skill — **all 35 stay for the whole day**. Module 1 is pitched at everyone; Module 2 is pitched at the ~10 developers, with the other 25 observing and keeping it as reference. The split is one of depth, not attendance.

## Start here

- **Attending?** Read `presentation/pre-reads.html` first (~30 min), then open `presentation/demo-guide.html` — it has the pre-flight checklist and every demo step.
- **Want the shape of the day?** `presentation/course-outline-copilot-studio.html`.
- **The slides** are `presentation/module-1-foundations.html` and `module-2-build.html`. Press **N** on any slide for that slide's notes, **O** for the index.
- **Want to build one yourself afterwards?** `use-cases/` has step-by-step guides you can follow in your own environment.
- **Not a developer?** `presentation/reference-pack.html` Part 3 is the part for you — what you can build on your own, without waiting for anything to be provisioned. Part 1 is ten prompts you can use today.

## Files

| File | Role |
|---|---|
| `training-requirements.txt` | **Requirements source of truth** — client requirements, constraints, open actions. *Internal; not included in this repo* |
| `resources.txt` | Curated Copilot Studio **YouTube resource list**, graded simple → advanced; candidate pre-read material |
| `demo-assets/` | Every synthetic asset the demos use — see the table below |
| `use-cases/` | **Build-it-yourself guides**, added after the day — one self-contained HTML page per use case, each a set of concise steps for rebuilding an agent in your own environment. Not part of the workshop; see its `README.md` |
| `presentation/course-outline-copilot-studio.html` | **Client-facing course outline** — demo-only, 27 Aug scope. Prints to 5 A4 pages; carries a requirements-coverage table |
| `presentation/module-1-foundations.html` | **Module 1 slide deck** — 18 slides, per-slide session notes (press N), keyboard/index navigation, hand-authored SVG diagrams sized to fill the frame and read from the back of a room. Self-contained, 1280×720 scaled stage |
| `presentation/module-2-build.html` | **Module 2 slide deck** — 32 slides, per-slide session notes (press N), segmented session progress, same diagram vocabulary as Module 1. Deep-build content: APIs, identity, failure engineering, schema, ALM, governance |
| `presentation/demo-guide.html` | **Participant demo follow-along guide** — all 11 demos (4 in Module 1, 7 in Module 2), with copy-paste prompts, sample data and troubleshooting |
| `presentation/pre-reads.html` | **Pre-read pack** sent ahead of the day — Copilot Studio primer, prompting cheat-sheet, agent anatomy, the capstone brief, and a graded video shortlist. ~30 min, 4 A4 pages |
| `presentation/reference-pack.html` | **Reference pack** to keep afterwards — a ten-prompt consulting prompt pack (copy buttons), a capability→workflow map for choosing what to build next, and the surfaces you can use without an environment or a developer. 12 A4 pages |

All six `presentation/` files are cross-linked and there is **no `.md` source of truth** for them — the HTML is the deliverable (deliberate, agreed 20 Aug 2026). Both decks print to PDF (18 and 32 pages at 1280×720).

**Both decks had a visual-clarity pass on 23 August 2026.** Every slide was reviewed as it renders rather than as markup, and three things changed. The smallest type — the notes under each label, used in 59 places — was too pale to survive a projector and was darkened to a readable contrast. A dozen text collisions and box overflows were fixed, along with four unlabelled marker dots that read as errors rather than emphasis. And ten diagrams that were floating small in the middle of the slide were re-proportioned to fill it: the Module 1 roadmap of the afternoon was rebuilt as a 3×2 grid of numbered stages with roughly 35% larger type, and nine tables and card grids were scaled up with it. **Slide counts, page counts and content are unchanged**, so any printout, note or page reference you already hold still matches.

## Demo assets

| File | Used by | What it is |
|---|---|---|
| `sample-fund-factsheet.pdf` / `.html` / `.txt` | every demo | The Northwind factsheet. Three formats, **identical fields and figures** — verified. Tracking error, portfolio turnover and NAV per unit are deliberately absent; several demos depend on that |
| `manager-update-jul-2026.txt` | 2.1 | Second knowledge source, so the agent has to choose between documents |
| `meridian-manager-update.txt` | 2.4, 2.7 | The deliberately messy document — ~18 of 25 fields unstated |
| `holdings.xlsx` · `benchmarks.xlsx` | 2.3 | Ranges already formatted as real Excel **Tables**, which is what the connector needs |
| `client-mandate-CL-4471.json` · `fx-response.json` | 2.2 | The "legacy internal system" and FX payloads |
| `benchmarks-sql.sql` | 2.3 | Stands up the benchmark DB + `usp_GetBenchmarkReturns` and `usp_GetExcessReturn`. Azure SQL free tier or SQL Server 2019+ |
| `slide-plan-sample.json` | 2.5 | A finished slide plan: 6 slides, every figure sourced, 2 `unresolved` |
| `deck-renderer.html` | 2.5 | **Plan in, deck out.** Self-contained browser page — the stand-in for the client's own generator. Warns if any figure arrives without a source |
| `plan-to-pptx.py` | 2.5 | **Plan in, real `.pptx` out.** One library (`python-pptx`), runs offline — the stand-in for a team's own generator. Shrinks type rather than overflow a box, and refuses to print a source it does not have |
| `investment-report-sample.pptx` | 2.5 | The sample plan as an editable PowerPoint file — what the capstone produces |
| `investment-report-sample.pdf` | 2.5 | The same plan through the browser renderer |

## Course shape

| | |
|---|---|
| **Module 1 — Foundations** | ~3 hrs · all 35 · 09:00–12:15 · how models behave, prompting for consulting work, what an agent is in Copilot Studio, where AI fits the IC workflow under governance |
| **Module 2 — Build** | ~5 hrs · all 35, pitched at ~10 developers · 13:00–18:00 · orchestration, external + legacy REST APIs, Excel/SQL, unstructured → structured extraction, PowerPoint generation, deploy/trigger/share/govern |
| **Capstone** | The **Investment Report Agent** — built live end to end |

## Scoping decisions

- **Microsoft-only by governance.** No Claude / open-source / LangChain in scope — Copilot Studio + M365 only. Microsoft Agent Framework positioned as the *longer-term* path, not built.
- **Two modules** matching the client's own split: foundations for all 35 (~3 hr) + a hands-on build track pitched at ~10 devs (~5 hr). Nobody leaves at lunch — the whole room sees the build.
- **One flagship capstone:** the *Investment Report Agent* — replaces the team's manual unstructured-data → structured → PowerPoint pipeline (today: manual + Aspose + custom code).
- **NO LAB — trainer live demo only** (client instruction, **20 Jul 2026**; supersedes the earlier Gheware-sandbox-for-all plan). Copilot Studio is opened on screen and the use case built live, showing enterprise-workflow linking, agent sharing and deployment. Nothing is provisioned for participants; no client-tenant readiness dependency.
- **Participants may follow along** on their own machines using `presentation/demo-guide.html` — optional, nothing required or provisioned. The guide has an A/B/C track system for whatever Copilot Studio access a participant turns out to have.
- **The agent must run unattended.** The client's stated ROI test is agents *integrated into workflows*, so session 2.6 / demo 2.7 ends with an automated trigger: a document lands, the agent extracts, enriches, builds the deck and raises an approval card with nobody at the keyboard.
- **Hybrid delivery is designed, not assumed.** The 5 online seats get a dedicated feed of the Copilot Studio window (not a room camera), a named facilitator watching the meeting chat, and recordings of the demo segments. In a demo-led day with no lab, the recording is what replaces the lab.
- **Deliberately excluded**, per the client: licensing theory, AI history/background, vendor comparisons.

## Content anchors

Every example across the outline, both decks and the demo guide uses the same synthetic fund — the **Northwind Multi-Asset Growth Fund** factsheet in `demo-assets/`. The client-reported pain point it targets is the manual *unstructured → structured → Aspose → PowerPoint* reporting pipeline.

## Open items

1. **Send the pre-reads** — `presentation/pre-reads.html` is built and ready; it needs to go out well before 27 Aug.
2. **One concrete use case + sample API/data** to anchor the capstone demo — the reporting pipeline is the natural candidate (synthetic fallback is built and tested, so this is an upgrade rather than a dependency).
3. **Confirm the Module 2 split** — 35 total is confirmed (30 in-room + 5 online); the ~10 developers for the build track still needs confirming against the new total.
4. **Confirm AV** for the 5 online seats: a dedicated screen feed, a named in-room facilitator, and permission to record the demo segments.

> Commercial terms and contact details are **deliberately not recorded in this repo** — this folder carries course material only.
