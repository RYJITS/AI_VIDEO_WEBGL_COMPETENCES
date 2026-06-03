# Carte du Projet

Cette carte aide les nouveaux utilisateurs et contributeurs a comprendre rapidement la structure du depot et le role de chaque dossier.

## Structure du Depot

```text
AI_VIDEO_WEBGL_COMPETENCES/
|-- README.md
|-- INSTALLATION.md
|-- CONTRIBUTING.md
|-- SECURITY.md
|-- CITATION.cff
|-- docs/
|-- codex-skills/
|-- cerveau-competence/
|-- scripts/
|-- examples/
`-- .github/
```

## Zones Principales

| Zone | Chemin | Role |
|---|---|---|
| Guide principal | `README.md` | Vue generale, presets, exemples, lecons apprises et installation rapide. |
| Installation | `INSTALLATION.md` | Setup Windows, ComfyUI, modeles Wan2.2, skills Codex et competence Cerveau. |
| Conclusions | `CONCLUSIONS.md` | Synthese courte de la strategie de production et des decisions techniques. |
| Skills Codex | `codex-skills/` | Skills reutilisables pour video start/end et composition WebGL a droite. |
| Competence Cerveau | `cerveau-competence/` | Competence partagee pour le workspace IA central. |
| Scripts | `scripts/` | Installateurs PowerShell pour skills, competence et profils de modeles Wan2.2. |
| Exemples | `examples/` | Videos temoins, contact sheets et workflows ComfyUI. |
| Documentation technique | `docs/` | Rapports QA, benchmarks, manifests et diagnostics. |
| GitHub | `.github/` | Templates issues, template pull request et workflow de validation. |

## Ordre de Lecture Recommande

1. `README.md` pour comprendre la methode generale et les preuves visuelles.
2. `INSTALLATION.md` pour preparer l'environnement local.
3. `CONCLUSIONS.md` pour connaitre la strategie technique retenue.
4. `codex-skills/video-start-end/SKILL.md` pour les videos image debut / image fin.
5. `codex-skills/webgl-right-video/SKILL.md` pour les compositions WebGL scroll-video.
6. `examples/README.md` pour choisir les assets de reference.
7. `docs/LOCAL_VALIDATION.md` avant une pull request.

## Flux de Production

```text
storyboard
-> keyframes propres
-> micro-clips start/end
-> generation Wan2.2 ou LTX
-> QA contact sheet
-> garder seulement les clips utiles
-> integration WebGL / scroll-video
```

## Ou Placer Une Contribution

- Comportement reutilisable Codex: `codex-skills/`.
- Comportement partage Cerveau: `cerveau-competence/`.
- Automatisation d'installation: `scripts/`.
- Preuves generees utiles: `examples/`.
- Analyses, manifests et notes QA: `docs/`.
- Processus GitHub: `.github/`.

Ne pas commiter de secrets, fichiers env locaux, rendus temporaires ou chemins absolus propres a une machine.
