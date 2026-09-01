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
| [`fund-research-assistant.html`](fund-research-assistant.html) | The workshop's own agent, end to end &mdash; grounded knowledge, a fixed-wording topic, six tools that fetch, compute and act, and finally a trigger that runs the whole chain when a file lands | ~90 min |
| [`render-endpoint-azure-function.html`](render-endpoint-azure-function.html) | The box behind the agent's last hop &mdash; an Azure Function in Python that turns a slide plan into a real PowerPoint file, from `func init` to a deployed, key-protected endpoint | ~45 min |
| [`autonomous-support-agent.html`](autonomous-support-agent.html) | An agent nobody talks to — started by an email arriving, three connectors bound directly as tools, a reply sent with no human in the loop | ~35 min |
| [`multi-agent-account-lookup.html`](multi-agent-account-lookup.html) | One parent behind one conversation — a topic that sets a global variable, two child agents gated on it by condition, and an already-built connected agent reached by description | ~40 min |

Each page prints cleanly to A4 if you would rather work from paper
(`fund-research-assistant.html` is 17 pages, `render-endpoint-azure-function.html` is 5,
`autonomous-support-agent.html` is 5,
`multi-agent-account-lookup.html` is 3).

## How these relate to the rest of the material

The demos are in [`../presentation/prompt-demos.html`](../presentation/prompt-demos.html),
and they all use the **Northwind** fund anchor so the figures line up across the decks and the
guide.

**`fund-research-assistant.html` is the one page that uses that anchor**, deliberately: it *is*
the agent the demos build, collapsed out of eight separate demos into one sequence you can follow
straight through at your own pace. Same figures, same instruction blocks, same expressions — so it
never contradicts the guide, and either can be read against the other.

The other two pages deliberately do **not** use the anchor — they are different jobs, on
different data, so nothing you build there can be confused with a demo figure.

The Fund Research Assistant page is the only one that covers the whole chain in build order: the four
things you configure, then six tools doing three different jobs — two that fetch (a public API, a
stand-in for a legacy internal system), two that compute (Excel, so no total is ever added by the
model), two that act (a human approval gate, and the plan-to-PowerPoint hop) — and finally the trigger.
It is now the **main document for this use case** — build sheet and demo script in one. Each of the six tools opens with a node-strip diagram and a per-node configuration table carrying every expression; the trigger flow gets a full diagram of both branches. Each stage also carries a **What this proves** line, a **Check** list, and the optional steps to drop first if you are short. A running-order table at the top gives the ~2-hour shape.

The Autonomous Support Agent covers ground the decks only name in passing:

- a **connector used directly as a tool**, rather than through a flow you wrote;
- a **trigger that is not a person** — the shape behind session 2.6's unattended run, at a size
  you can build in an afternoon;
- what it costs to have **no human in the loop**, stated as six specific gaps rather than a warning.

The Multi-Agent page covers the other thing the decks only name in passing — **more than one agent**.
It builds **one** agent, the `Sales Associate Assistant` parent, and treats the account-lookup agent it
delegates to as a prerequisite that already exists — so the whole page stays on the parent:

- the difference between a **child agent** (lives inside the parent, published with it) and a
  **connected agent** (its own agent, published separately, reusable by many parents);
- **two kinds of routing in one agent** — the two product child agents gated by a *condition* on
  `Global.Market`, which is deterministic, and the connected agent chosen by the *orchestrator* from a
  description, which is not. They fail differently and are debugged from opposite ends, which is the
  page's real subject;
- a **global variable set by a topic** the orchestrator chooses from its description, with the
  *Conversation Start* redirect kept as a second way in rather than the mechanism &mdash; redirect-only
  works in the Test pane and fails silently in Microsoft 365 Copilot.

> **Building the connected agent is a separate job** and deliberately out of scope here — it carries
> Dataverse search indexing, Quick Find *Find by* columns and a connection-consent trap that would bury
> the routing lesson. The page links
> [microsoft/mcs-labs → `mcs-multi-agent`](https://github.com/microsoft/mcs-labs/tree/main/labs/mcs-multi-agent)
> for it, which is also listed in `../resources.txt`.

## Use synthetic data

The same rule as the demo guide, and it matters more here because these agents **act**: build
against a test mailbox and a project whose tickets contain nothing confidential. Do not point
anything you build here at a shared or team inbox until you have worked through the
*Before you use this for real* section at the end of the page.
