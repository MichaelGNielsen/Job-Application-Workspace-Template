# 🧭 Job Application Workspace (Template - Tintin Edition)

Dette er det officielle Template-miljø for **Job Application Agent**, illustreret med den ikoniske reporter **Tintin** som case-studie.

Dette repository orkestrerer selve AI-agenten og dens uafhængige AI-mikrotjenester via **Git Submodules**, hvilket sikrer et fuldt isoleret, lokalt AI-arbejdsmiljø ("Zero Host Dependency").

## 📂 Workspace Struktur

Workspace'et består af tre primære submodules. For detaljeret information om hver del, se venligst deres respektive README-filer:

*   **[Job Application Agent Template (Tintin Edition) - v5.6.1](./template/README.md)**: Hovedapplikationen, der automatiserer jobansøgningsprocessen.
*   **[Ollama Server Setup](./ollama-server/README.md)**: En lokal AI-fallback motor til at køre modeller lokalt.
*   **[OpenCode AI Server (Dockerized)](./opencode-server/README.md)**: En eksperimentel, containeriseret AI-server til brug i lokale netværk.

**Vigtig Bemærkning om Links:** Linksene ovenfor peger på README-filerne inden i de enkelte submoduler. Disse links vil kun virke korrekt, når du har klonet hele projektet **inklusive submodulerne**. Sørg for at bruge `git clone --recursive` eller kør `git submodule update --init --recursive` efter en almindelig clone.

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

> **Bemærk (Gemini AI):** For at undgå API Rate Limits (GDPR) på Gemini, låner Docker-containeren dine host-credentials. Husk derfor at køre `gemini login` i din terminal, før du starter systemet. For mere information om Gemini AI, se [Google AI Platform](https://ai.google.dev/).

## 🤖 Gemini Integration

Dette projekt anvender Google Gemini AI til forskellige opgaver, herunder tekstgenerering og CV-optimering. For at kunne tilgå Gemini API'en uden rate limits, er det nødvendigt at logge ind via Gemini CLI på din host-maskine.

### Krav til Gemini CLI
1.  **Installation:** Installér Gemini CLI: `npm install -g @google/gemini-cli`
2.  **Login:** Autentificer dig: `gemini login`

Dette setup sikrer, at din lokale Docker-container kan autentificere sig sikkert uden at kompromittere API-nøgler.
