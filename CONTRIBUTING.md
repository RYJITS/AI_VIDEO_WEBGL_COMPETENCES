# Contribuer

Merci de vouloir ameliorer ce kit. Le depot est francais-first et oriente production: chaque ajout doit aider a tester, valider ou integrer des videos IA start/end dans un workflow WebGL.

## Priorites

- Ameliorer les presets, prompts, rapports QA et workflows ComfyUI.
- Ajouter des exemples utiles et legers a comprendre.
- Garder les procedures compatibles Windows, Codex et Cerveau Central.
- Documenter les temps de generation, la machine utilisee et les limites observees.

## Avant Une Pull Request

1. Lire `README.md`, `INSTALLATION.md` et `CONCLUSIONS.md`.
2. Verifier que les chemins ne contiennent pas de secrets ou de fichiers locaux non portables.
3. Pour les workflows JSON, confirmer qu'ils s'ouvrent dans ComfyUI.
4. Pour les videos ou contact sheets, garder seulement les assets qui prouvent une decision technique.
5. Expliquer ce qui est ajoute, supprime ou remplace.

## Style

- Preferer le francais clair, avec termes techniques anglais quand ils sont standards.
- Utiliser des chemins relatifs au depot dans la documentation.
- Eviter les grands paragraphes abstraits: inclure les reglages, observations et decisions.
- Ne pas ajouter de dependances lourdes sans justification.

## Tests Recommandes

Pour une contribution documentaire:

```powershell
git status --short
```

Pour un workflow JSON:

```powershell
Get-Content .\examples\workflows\<fichier>.json | ConvertFrom-Json | Out-Null
```

Pour une video:

```powershell
ffprobe -v error -show_entries stream=width,height,nb_frames,r_frame_rate,duration -of json .\examples\videos\<clip>.mp4
```

## Licence

Ce depot ne declare pas encore de licence open source. Avant de reutiliser ou redistribuer largement le contenu, ouvrir une issue pour choisir explicitement la licence.
