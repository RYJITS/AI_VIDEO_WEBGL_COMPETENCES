# Securite

Ce depot contient des workflows, scripts d'installation et exemples media. Il ne doit jamais contenir de cles API, tokens, mots de passe, fichiers `.env` ou chemins prives non generalisables.

## Signaler Un Probleme

Ouvrir une issue si le probleme ne revele pas de secret actif. Pour un secret expose ou une faille exploitable, contacter le mainteneur du depot avant publication publique.

Inclure si possible:

- fichier concerne;
- commande ou action qui declenche le probleme;
- environnement: Windows, ComfyUI, GPU, version Python/Node;
- impact potentiel;
- proposition de correction.

## Bonnes Pratiques

- Ne jamais commiter `env.Local`, `.env`, tokens Hugging Face, cles API ou logs contenant des secrets.
- Rediger les chemins en exemples generiques, par exemple `D:\ComfyUI\ComfyUI`.
- Verifier les scripts PowerShell avant execution.
- Telecharger les modeles uniquement depuis les sources officielles indiquees dans la documentation.
