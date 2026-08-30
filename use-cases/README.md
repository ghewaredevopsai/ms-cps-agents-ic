# use-cases/

**Build it yourself.** One self-contained HTML page per use case: simple, concise steps you
can follow in your own environment, at your own pace.

Each page assumes you have your own Copilot Studio environment and starts from an empty agent.
Nothing is provisioned for you — that is the point.

Every page is written to the same shape: *what you are building &rarr; before you start &rarr;
staged steps with the exact text to paste &rarr; two tests, one of which is supposed to fail
&rarr; what to do when nothing comes back &rarr; what stands between it and production.*

| Page | What you build | Time |
|---|---|---|
| [`autonomous-support-agent.html`](autonomous-support-agent.html) | An agent nobody talks to — started by an email arriving, three connectors bound directly as tools, a reply sent with no human in the loop | ~35 min |
| [`multi-agent-account-lookup.html`](multi-agent-account-lookup.html) | Three agents behind one conversation — a parent that routes, a child agent held inside it, and a separately published connected agent that queries Dataverse | ~40 min |

Each page prints cleanly to A4 if you would rather work from paper
(`autonomous-support-agent.html` is 5 pages, `multi-agent-account-lookup.html` is 6).

## How these relate to the rest of the material

The demos are in [`../presentation/demo-guide.html`](../presentation/demo-guide.html),
and they all use the **Northwind** fund anchor so the figures line up across the decks and the
guide. These pages deliberately do **not** use that anchor — they are different jobs, on
different data, so nothing you build here can be confused with a demo figure.

The Autonomous Support Agent covers ground the decks only name in passing:

- a **connector used directly as a tool**, rather than through a flow you wrote;
- a **trigger that is not a person** — the shape behind session 2.6's unattended run, at a size
  you can build in an afternoon;
- what it costs to have **no human in the loop**, stated as six specific gaps rather than a warning.

The Multi-Agent page covers the other thing the decks only name in passing — **more than one agent**:

- the difference between a **child agent** (lives inside the parent, published with it) and a
  **connected agent** (its own agent, published separately, reusable by many parents);
- **orchestration as a routing decision** made at run time from the descriptions you wrote — which is
  why the page makes you test that the *wrong* agent does not answer;
- the **Dataverse prerequisites** nobody mentions until the agent returns nothing: search indexing,
  and the fact that a Quick Find view's *Find by* columns — not its view columns — decide what is searchable.

> ⚠️ **If you hit `HTTP 403 — connectorAuthorizationError`, it is almost certainly consent, not the
> connection.** An agent must be granted permission to use a connection, and tools that arrive by
> importing a solution never raise that prompt. See *When nothing comes back* on the page.

## Use synthetic data

The same rule as the demo guide, and it matters more here because these agents **act**: build
against a test mailbox and a project whose tickets contain nothing confidential. Do not point
anything you build here at a shared or team inbox until you have worked through the
*Before you use this for real* section at the end of the page.
