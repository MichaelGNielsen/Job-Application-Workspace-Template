# 🧭 Job Application Workspace (Template - Tintin Edition)

Dette er det officielle Template-miljø for **Job Application Agent**, illustreret med den ikoniske reporter **Tintin** som case-studie.

Dette repository orkestrerer selve AI-agenten og dens uafhængige AI-mikrotjenester via **Git Subrepo**, hvilket gør arkitekturen mere smidig og undgår "Detached HEAD" problemer.

## 🛠️ Forudsætninger (Installation af git-subrepo)

For at kunne synkronisere komponenterne, skal du have `git-subrepo` installeret på din maskine. Hvis du ikke har det endnu, kan du installere det med disse kommandoer:

```bash
git clone https://github.com/ingydotnet/git-subrepo ~/git-subrepo
echo "source ~/git-subrepo/.rc" >> ~/.bashrc
source ~/.bashrc
```

## 📂 Workspace Struktur

Workspace'et består af tre primære komponenter (integreret som subrepos):

- **[Job Application Agent Template (Tintin Edition)](./template/README.md)**: Hovedapplikationen, der automatiserer jobansøgningsprocessen.
- **[Ollama Server Setup](./ollama-server/README.md)**: En lokal AI-fallback motor til at køre modeller lokalt.
- **[OpenCode AI Server (Dockerized)](./opencode-server/README.md)**: En containeriseret AI-server til brug i lokale netværk.

## 🔄 Synkronisering af komponenter (Få "Tippen")

Da vi bruger `git-subrepo`, behøver du ikke længere `--recursive` flaget eller `git submodule update`. For at hente de nyeste ændringer ("tippen") fra de originale repositories, skal du blot køre:

```bash
# Opdater en specifik mappe (f.eks. template)
git subrepo pull template

# Eller opdater alle subrepos på én gang
git subrepo pull --all
```

Hvis du vil sende rettelser tilbage til kilden:
```bash
git subrepo push template
```

## 🚀 Installation & Opstart

For at hente hele systemet:

```bash
git clone https://github.com/MichaelGNielsen/Job-Application-Workspace-Template.git
cd Job-Application-Workspace-Template
```

### Start Systemet
Vi har samlet opstarten af både de lokale AI-servere og selve applikationen i ét simpelt script:

```bash
./start_all.sh
```

Scriptet vil:
1. Starte `ollama` (Port 11434).
2. Starte `opencode` (Port 4096).
3. Starte `template` (Agenten) via Docker Compose (Port 3000 & 3002).

> **Standard-porte:** Systemet bruger nu 11434 (Ollama) og 4096 (OpenCode). Container-navnene er forenklet til `ollama` og `opencode` for maksimal kompatibilitet med andre værktøjer (f.eks. Open WebUI).

## 🤖 Gemini Integration

Dette projekt anvender Google Gemini AI. For at undgå rate limits, skal du logge ind via Gemini CLI på din host-maskine:

1. **Installation:** `npm install -g @google/gemini-cli`
2. **Login:** `gemini login`
