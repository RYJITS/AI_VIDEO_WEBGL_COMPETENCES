### Guide de depannage rapide pour les workflows ComfyUI/Wan/LTX

#### 1. Probleme de lancement de ComfyUI
- Verifier que Python 3.10+ est installe
- Executer: `python main.py --listen`
- Consulter les logs pour les erreurs de dependances manquantes

#### 2. Erreur de GPU/CPU
- Verifier la compatibilite CUDA avec votre GPU
- Tester avec: `python main.py --cpu` pour isoler le probleme
- Mettre a jour les pilotes NVIDIA

#### 3. Probleme de workflow Wan/LTX
- Verifier que les fichiers .safetensors sont dans le bon dossier
- Confirmer la version de Wan/LTX compatible avec ComfyUI
- Tester avec un workflow minimal fourni dans les exemples

#### 4. Erreur de rendu video
- Verifier les codecs FFmpeg installes
- Tester avec un preset video simple
- Consulter les logs pour les erreurs de pipeline

#### 5. Probleme de WebGL integration
- Verifier que les shaders sont compiles sans erreur
- Tester avec un navigateur moderne (Chrome/Firefox)
- Consulter la console du navigateur pour les erreurs JavaScript

#### 6. Ressources utiles
- Documentation officielle: https://github.com/comfyanonymous/ComfyUI
- Forum Wan/LTX: https://github.com/Lightning-AI/lightning-wan22/discussions
- Wiki troubleshooting: https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES/wiki

---
Si le probleme persiste, ouvrir une issue avec les logs et details de l'environnement.
