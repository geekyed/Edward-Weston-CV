# Edward James Weston

[eddweston@me.com](mailto:eddweston@me.com)

Staff Software Architect specialising in contact-centre and real-time communications platforms. I led architecture for the agent user interface released in 2025. It delivered over 4x its first-year target and earned me a Top Performance award. I create the architecture reviews, reliability tiers and Tech Radar that help autonomous teams make strong decisions. I practise consultative architecture: teams own their solutions, and I help them reach good ones.

***

## Employment

### Vonage _(2013 - Current)_

Progressed from software engineer to Staff Software Architect across APIs, agent interfaces and architecture.

#### `Staff Software Architect (2024 - Current)`

Since being promoted to Staff Architect, I have focused on cross-functional leadership and on creating architecture processes that enable strong governance, alongside my team-based responsibilities:

* New Agent User Interface: Architecture lead for the agent UI released in 2025, coordinating teams across four geographies. Adopted event-carried state transfer to eliminate polling and give the UI stronger guarantees that it holds the right data. It exceeded its first-year commercial target by over 4x, and it is gradually replacing our existing UI while opening a new market across many CRMs. One of four people singled out for a Top Performance award from our parent company, from hundreds of contributors.

* Architecture Review Process: Introduced a periodic architecture review of each team-owned domain, built around interactive sessions with the whole team. Findings become actionable tickets in the teams' non-feature backlogs, and the administration is automated with an agentic workflow that is now shared with the wider architecture group. Run across five domains so far, with a training session for the other architects in the organisation.

* Architecture Feature Review: Introduced, through an ADR agreed with the other architects, an architect review of every Apps feature before teams plan it, tracked in Jira so the state is visible across all value streams. Architect involvement is scaled to each feature's complexity and risk, and I am the named architect on 116 epics since late 2024.

* Non-Feature Work Prioritisation: Introduced a process, agreed with the Director and Engineering Managers, for prioritising non-feature work (tech debt, vulnerabilities, availability and bugs) across my value stream. Facilitated sessions with two teams so far, prioritising 20+ tickets each, and leadership can now see the feature and non-feature split. Shared with the wider architecture group as good practice.

* Component Reliability Categorisation: Designed a framework that classifies every platform component into reliability tiers with matching availability targets and declared dependencies. Shaped the approach in consultation with many teams and piloted it with one team before rolling it out to all 30 development teams, with categorisation now raised for 316 components. This ensures the most critical components are identified and held to the resilience they need.

* Security Assessment with AI: Built a repeatable AI skill that assessed the authorisation of every public endpoint across 24 services in four teams. Raised a ticket for each team and left them to break the findings into service work.

Case studies in helping teams reach decisions:

* Real-time transcript persistence: The database could not cope with the volume of utterances, and Redis-only storage risked data loss. Over six months I helped the team weigh three options: Google's storage (tight GCP coupling), Redis with batched MySQL inserts (still loses data on Redis upgrades) and Kafka with batch consumers (more complex, small delay to the API). Having gathered the first consumer's requirements, I recommended an option and the team chose Kafka, which is now live. I encouraged the lead engineer to present it to the architecture forum.

* Real-time messaging resilience: Two incidents in April 2026 left agents unable to answer calls, made worse by clients retrying at several layers. I asked the teams where retries were needed and why. The developers traced each layer themselves and agreed to retry in one place only, with back-off and jitter, so a recovering service is not hit by a stampeding herd. The two minor outages since have had far less impact.

#### `Senior Software Architect (2022 - 2024)`

In 2022 I joined the architecture team in the apps organisation to take on a new challenge, practising consultative architecture with five assigned teams.

* Documented the architecture of eight domains as C4 diagrams in Lucidchart and helped the owning teams plan their future direction. Worked with the product team to plan future architecture and assess the technical feasibility of planned product enhancements.

* Took ownership of the department-wide Tech Radar, which sets technical direction across the organisation, and continue to run it as Staff Architect. It now covers 99 technologies across four quadrants, with changes proposed openly as GitHub issues and decided at the architecture forum.

#### `Senior Software Engineer (2021 - 2022)`

* Took on the Agent Experience domain when the department moved to stream-aligned teams and organised it until the team owned it. Prototyped a new calling provider at a hackathon using the offering of a company Vonage had acquired, built the business case, and led the implementation of a new provider for delivering calls to the browser using WebRTC, saving approximately $6m a year in fees to an external vendor. Authored the project's contributing guide and Tech Radar.

#### `Software Engineer (2013 - 2021)`

* Core developer of the contact centre API platform, written in Go, which is still in use and handles approximately 260 million requests a day.

* Owned the agent UI used in our contact centres, along with its supporting services and browser extensions. Improved its performance and extracted its core code from our monolith so it could be deployed independently.

### Hewlett Packard _(2011 - 2013)_

`Software Developer`

* Built parts of a multi-threaded C++ component on Red Hat Enterprise Linux and owned the team's CI pipeline.

### Intel Corporation UK _(2007 - 2008)_

`Technical Marketing Engineer`

* One-year placement benchmarking desktop and server components.

***

## Education

`Loughborough University (2005 - 2009)`

* BEng (Hons) Electronic and Electrical Engineering, 2:1

***

## Skills

**Languages:** C#, Go, TypeScript, JavaScript

**Frameworks:** .NET, React, Redux, Svelte

**Cloud and data:** AWS, GCP, Docker, MySQL, Microservices

***

## Interests

In my spare time, I enjoy running, working on personal projects, and spending time with my family.
