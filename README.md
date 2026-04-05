# Job Application Workspace (Template - Tintin Edition)

Dette er det officielle Template-miljø for **Job Application Agent**, illustreret med den ikoniske reporter **Tintin** som case-studie.

Dette repository orkestrerer selve AI-agenten og dens uafhængige AI-mikrotjenester via **Git Submodules**, hvilket sikrer et fuldt isoleret, lokalt AI-arbejdsmiljø ("Zero Host Dependency").

## 📂 Struktur
Workspace'et består af tre primære submodules:
1. `template/` - Job Application Agent (Template udgaven med Tintin data).
2. `ollama-server/` - Lokal AI-fallback motor.
3. `opencode-server/` - Eksperimentel lokal AI-agent.

## 🚀 Installation & Opstart (Ny Maskine)

For at hente hele systemet inklusive alle under-projekter, skal du klone med `--recursive`:

```bash
git clone --recursive https://github.com/MichaelGNielsen/Job-Application-Workspace-Template.git
cd Job-Application-Workspace-Template
```

### Hvis du har glemt `--recursive` ved clone:
Hvis du allerede har klonet mappen, men den er tom, skal du køre:
```bash
git submodule update --init --recursive
```

### Start Systemet
Vi har samlet opstarten af både de lokale AI-servere og selve applikationen i ét simpelt script:

```bash
./start_all.sh
```

Scriptet vil:
1. Starte `ollama-server` (Port 11435).
2. Starte `opencode-server` (Port 4097).
3. Starte `template` (Agenten) via Docker Compose (Port 3000 & 3002).

> **Bemærk (Gemini AI):** For at undgå API Rate Limits (GDPR) på Gemini, låner Docker-containeren dine host-credentials. Husk derfor at køre `gemini login` i din terminal, før du starter systemet.
