# Exemples de delegation future a Mistral

Ce document propose des **exemples concrets** pour deleguer des taches futures a Mistral, un agent IA specialise dans la generation de documentation, de templates, de drafts CI et de propositions de code legeres. Ces exemples sont organises par cas d'usage et incluent des prompts prets a l'emploi, des structures de fichiers, et des bonnes pratiques.

---

## 1. Generer une documentation technique complete

### Cas d'usage
Vous souhaitez documenter une nouvelle competence, un workflow ComfyUI, ou une integration WebGL, mais manquez de temps ou d'expertise pour rediger une documentation claire et structuree.

### Exemple de prompt pour Mistral
```markdown
**Contexte** :
- Projet : AI_VIDEO_WEBGL_COMPETENCES
- Objectif : Documenter la competence `VideoToWebGL` pour une integration dans ComfyUI.
- Public cible : Developpeurs intermediaires.
- Structure souhaitee :
  1. Introduction (objectif, cas d'usage)
  2. Prerequis (versions logicielles, materiel)
  3. Installation (etapes detaillees)
  4. Configuration (fichiers a modifier, variables d'environnement)
  5. Exemple d'utilisation (workflow JSON minimal)
  6. Depannage (erreurs courantes et solutions)
  7. FAQ (questions frequentes)

**Contraintes** :
- Utiliser un ton technique mais accessible.
- Inclure des exemples de code ou de commandes.
- Citer les sources officielles (ComfyUI, WebGL).
- Ajouter une section "Validation" avec des tests simples.
```

### Exemple de sortie attendue
```markdown
# Competence : VideoToWebGL

## Introduction
La competence `VideoToWebGL` permet de convertir une video en un rendu WebGL interactif, compatible avec ComfyUI. Ideal pour les projets de visualisation 3D ou les interfaces utilisateur dynamiques.

## Prerequis
- ComfyUI version 0.9.x ou superieure
- Python 3.11+
- GPU NVIDIA (RTX 30xx/40xx recommande)
- Node.js 18+ (pour les outils de build)

## Installation
1. Cloner le depot :
   ```bash
   git clone https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES.git
   cd AI_VIDEO_WEBGL_COMPETENCES
   ```
2. Installer les dependances :
   ```bash
   pip install -r requirements.txt
   npm install -g yarn
   yarn install
   ```

## Configuration
1. Copier le fichier `config.example.json` en `config.json` et adapter les chemins :
   ```json
   {
     "video_path": "./assets/input.mp4",
     "output_dir": "./output/webgl/",
     "gpu_id": 0
   }
   ```
2. Verifier les variables d'environnement dans `.env` :
   ```env
   COMFYUI_API_URL=http://localhost:8188
   ```

## Exemple d'utilisation
### Workflow minimal (ComfyUI)
```json
{
  "nodes": [
    {
      "id": "video_loader",
      "type": "VideoLoader",
      "params": {"video_path": "./input.mp4"}
    },
    {
      "id": "webgl_renderer",
      "type": "VideoToWebGL",
      "params": {"resolution": "1920x1080"}
    }
  ]
}
```

### Commande CLI
```bash
python scripts/video_to_webgl.py --input ./input.mp4 --output ./output/ --resolution 1920x1080
```

## Depannage
| Erreur | Cause | Solution |
|--------|-------|----------|
| `ModuleNotFoundError: No module named 'webgl'` | Dependances manquantes | `pip install webgl-renderer` |
| `GPU out of memory` | Taille video trop grande | Reduire la resolution ou utiliser `--low-memory` |

## FAQ
**Q : Comment optimiser les performances ?**
R : Utilisez `--gpu-id 1` pour specifier un GPU dedie ou reduisez la resolution avec `--resolution 1280x720`.

**Q : Puis-je utiliser des videos 4K ?**
R : Oui, mais assurez-vous d'avoir au moins 8 Go de VRAM et utilisez `--low-memory` pour eviter les crashes.

## Validation
1. Executer le workflow avec une video de test (ex: `tests/sample.mp4`).
2. Verifier que le rendu WebGL s'affiche correctement dans un navigateur.
3. Comparer les metriques de performance (FPS) avec la baseline.
```

---

## 2. Creer un template d'issue GitHub

### Cas d'usage
Vous souhaitez standardiser les demandes de fonctionnalites ou de corrections pour gagner du temps dans le traitement des issues.

### Exemple de prompt pour Mistral
```markdown
**Contexte** :
- Projet : AI_VIDEO_WEBGL_COMPETENCES
- Type de template : Issue pour une nouvelle competence (ex: `TextToVideo3D`).
- Structure souhaitee :
  1. Titre clair et descriptif
  2. Description avec sections :
     - Besoin (probleme resolu)
     - Proposition (solution technique)
     - Zone concernee (Documentation/Skill Codex/Workflow ComfyUI)
     - Validation attendue (criteres de succes)
  3. Labels recommandes
  4. Checklist pour l'auteur

**Contraintes** :
- Utiliser le format YAML pour la template GitHub.
- Inclure des placeholders pour les sections dynamiques.
- S'assurer que le template est compatible avec `.github/ISSUE_TEMPLATE/feature_request.yml`.
```

### Exemple de sortie attendue (template YAML)
```yaml
name: "[Feature] Nouvelle competence : TextToVideo3D"
description: Proposer une nouvelle competence pour convertir du texte en video 3D dans ComfyUI.
title: "[Feature] TextToVideo3D"
labels: ["enhancement", "skill-codex"]
body:
  - type: textarea
    id: need
    attributes:
      label: Besoin
      description: Quel probleme cette competence resout-elle ?
      placeholder: |
        Actuellement, il n'existe pas de moyen simple de generer une video 3D a partir de texte dans ComfyUI.
        Cette competence permettrait aux artistes de creer des animations 3D sans competences en modelisation 3D.
    validations:
      required: true
  
  - type: textarea
    id: proposal
    attributes:
      label: Proposition
      description: Decris la solution technique souhaitee.
      placeholder: |
        - Utiliser un modele de diffusion 3D (ex: Stable Diffusion 3D ou un modele personnalise).
        - Integrer le modele dans un nud ComfyUI avec les parametres suivants :
          - `prompt`: Texte d'entree
          - `negative_prompt`: Elements a eviter
          - `resolution`: Resolution de sortie (ex: 1024x1024)
          - `duration`: Duree de la video (en secondes)
        - Ajouter une option pour exporter le rendu en WebGL.
    validations:
      required: true
  
  - type: dropdown
    id: area
    attributes:
      label: Zone concernee
      options:
        - Skill Codex
        - Workflow ComfyUI
        - Documentation
      default: 0
    validations:
      required: true
  
  - type: textarea
    id: validation
    attributes:
      label: Validation attendue
      description: Comment saurons-nous que la competence fonctionne ?
      placeholder: |
        - Le nud ComfyUI doit generer une video 3D a partir d'un texte d'entree.
        - La video doit etre exportable en format MP4 ou WebM.
        - Les performances doivent etre acceptables (ex: < 30s pour une video de 5s en 1024x1024).
        - La documentation doit inclure un exemple d'utilisation.
    validations:
      required: true
  
  - type: textarea
    id: references
    attributes:
      label: References utiles
      description: Liens vers des modeles, outils ou documentations pertinents.
      placeholder: |
        - [Stable Diffusion 3D](https://github.com/Stability-AI/generative-models)
        - [ComfyUI Custom Nodes](https://github.com/comfyanonymous/ComfyUI)
        - [WebGL Renderer](https://threejs.org/)
```

---

## 3. Rediger un draft de workflow CI/CD

### Cas d'usage
Vous souhaitez automatiser des tests ou des validations pour un nouveau nud ComfyUI, mais manquez de temps pour ecrire un workflow GitHub Actions.

### Exemple de prompt pour Mistral
```markdown
**Contexte** :
- Projet : AI_VIDEO_WEBGL_COMPETENCES
- Objectif : Creer un workflow CI pour tester un nouveau nud ComfyUI (`VideoToWebGL`).
- Etapes a automatiser :
  1. Installation des dependances
  2. Execution des tests unitaires
  3. Validation des performances (FPS)
  4. Generation d'un rapport de couverture
- Contraintes :
  - Utiliser GitHub Actions
  - Compatible avec Windows et Linux
  - Inclure des etapes de cache pour les dependances
  - Ajouter des badges de statut dans le README
```

### Exemple de sortie attendue (workflow YAML)
```yaml
name: CI - VideoToWebGL

on:
  push:
    branches: [ main, dev ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: ["3.11"]
    steps:
      - uses: actions/checkout@v4
      
      - name: Set up Python ${{ matrix.python-version }}
        uses: actions/setup-python@v4
        with:
          python-version: ${{ matrix.python-version }}
          cache: 'pip'
      
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt
          pip install pytest pytest-cov
      
      - name: Cache ComfyUI
        uses: actions/cache@v3
        with:
          path: |
            ~/.cache/ComfyUI
            ./custom_nodes
          key: ${{ runner.os }}-comfyui-${{ hashFiles('**/requirements.txt') }}
          restore-keys: |
            ${{ runner.os }}-comfyui-
      
      - name: Run unit tests
        run: |
          pytest tests/unit/ --cov=src --cov-report=xml
      
      - name: Upload coverage report
        uses: codecov/codecov-action@v3
        with:
          file: ./coverage.xml
          flags: unittests
          name: codecov-umbrella
      
      - name: Performance validation
        run: |
          python scripts/benchmark.py --node VideoToWebGL --iterations 10
          # Verifier que les FPS sont > 20
          python scripts/validate_performance.py --min-fps 20
      
      - name: Generate badges
        if: success()
        run: |
          echo "::set-output name=status::success"
          echo "::set-output name=coverage::$(python scripts/get_coverage.py)"
      
      - name: Update README badges
        if: success()
        run: |
          # Utiliser une action pour mettre a jour les badges dans le README
          # Exemple : https://github.com/marketplace/actions/badge-updater
          echo "Badges mis a jour avec succes."
```

---

## 4. Proposer un draft de pull request (PR) leger

### Cas d'usage
Vous souhaitez soumettre une petite amelioration (ex: correction de documentation, ajout d'un exemple) sans ecrire une PR complete.

### Exemple de prompt pour Mistral
```markdown
**Contexte** :
- Projet : AI_VIDEO_WEBGL_COMPETENCES
- Type de changement : Correction de la documentation pour la competence `VideoToWebGL` (section "Depannage").
- Structure souhaitee :
  1. Titre clair et descriptif
  2. Description avec :
     - Contexte du changement
     - Modifications apportees
     - Impact (ex: amelioration de la lisibilite)
  3. Liste des fichiers modifies
  4. Instructions pour reviewer
  5. Checklist pour l'auteur

**Contraintes** :
- Utiliser le format standard de PR GitHub.
- Inclure des extraits de code ou de documentation pour illustrer les changements.
- S'assurer que le draft est compatible avec `.github/pull_request_template.md`.
```

### Exemple de sortie attendue (draft de PR)
```markdown
---
**Titre** : docs(VideoToWebGL): corriger la section "Depannage" pour plus de clarte

**Description** :
Cette PR corrige la section "Depannage" de la documentation `VideoToWebGL` pour ameliorer la lisibilite et ajouter des solutions aux erreurs courantes.

### Modifications apportees :
1. Reorganise la section en tableau pour une meilleure lisibilite.
2. Ajoute des solutions pour les erreurs `GPU out of memory` et `ModuleNotFoundError`.
3. Clarifie les etapes de validation.

### Fichiers modifies :
- `docs/VideoToWebGL.md`

### Impact :
- Ameliore l'experience utilisateur pour les nouveaux contributeurs.
- Reduit le nombre d'issues liees a des erreurs de configuration.

### Instructions pour reviewer :
1. Verifier que les solutions proposees fonctionnent dans un environnement standard.
2. Tester les commandes de validation mentionnees.
3. S'assurer que le ton reste technique mais accessible.

### Checklist :
- [x] Les modifications sont testees localement.
- [x] La documentation est a jour.
- [x] Les exemples de code sont valides.
- [ ] Les labels (`documentation`, `good first issue`) sont ajoutes.
```

---

## 5. Generer un exemple de code leger pour une nouvelle competence

### Cas d'usage
Vous souhaitez proposer une implementation legere pour une nouvelle competence (ex: `ImageToVideo`) sans ecrire tout le code.

### Exemple de prompt pour Mistral
```markdown
**Contexte** :
- Projet : AI_VIDEO_WEBGL_COMPETENCES
- Competence : `ImageToVideo` (convertir une image en video avec effets de transition).
- Structure souhaitee :
  1. Classe Python avec les methodes principales (`__init__`, `process`, `validate`)
  2. Exemple d'integration dans ComfyUI (nud personnalise)
  3. Documentation minimale (docstring, exemple d'utilisation)
  4. Tests unitaires basiques
- Contraintes :
  - Utiliser des bibliotheques existantes (OpenCV, Pillow, NumPy).
  - Code commente et lisible.
  - Compatible avec Python 3.11+
```

### Exemple de sortie attendue (code Python)
```python
"""
Competence : ImageToVideo
Description : Convertit une image en video avec des effets de transition (fondu, glissement).
Auteur : [Votre Nom]
Date : 2026-06-03
"""

import os
import cv2
import numpy as np
from PIL import Image
from typing import Optional


class ImageToVideo:
    """
    Convertit une image en video avec des effets de transition.
    
    Attributs :
        input_path (str): Chemin vers l'image d'entree.
        output_path (str): Chemin vers la video de sortie.
        duration (int): Duree de la video en secondes.
        fps (int): Nombre d'images par seconde.
        transition_type (str): Type de transition ('fade', 'slide', 'none').
    """

    def __init__(
        self,
        input_path: str,
        output_path: str,
        duration: int = 5,
        fps: int = 30,
        transition_type: str = "fade",
    ):
        """Initialise la competence avec les parametres de base."""
        self.input_path = input_path
        self.output_path = output_path
        self.duration = duration
        self.fps = fps
        self.transition_type = transition_type
        self._validate_inputs()

    def _validate_inputs(self) -> None:
        """Valide les entrees pour eviter les erreurs."""
        if not os.path.exists(self.input_path):
            raise FileNotFoundError(f"Image introuvable : {self.input_path}")
        if self.duration <= 0:
            raise ValueError("La duree doit etre positive.")
        if self.fps <= 0:
            raise ValueError("Le FPS doit etre positif.")

    def _load_image(self) -> np.ndarray:
        """Charge l'image d'entree en tant que tableau NumPy."""
        img = Image.open(self.input_path)
        return np.array(img)

    def _apply_transition(self, frame: np.ndarray, total_frames: int) -> np.ndarray:
        """Applique une transition a un frame."""
        if self.transition_type == "fade":
            alpha = np.linspace(0, 1, total_frames)
            return (frame * alpha).astype(np.uint8)
        elif self.transition_type == "slide":
            # Exemple : defilement horizontal
            for i in range(total_frames):
                frame[:, i % frame.shape[1]] = 255
            return frame
        return frame

    def process(self) -> None:
        """Genere la video a partir de l'image."""
        img = self._load_image()
        total_frames = self.duration * self.fps
        fourcc = cv2.VideoWriter_fourcc(*'mp4v')
        out = cv2.VideoWriter(
            self.output_path, fourcc, self.fps, (img.shape[1], img.shape[0])
        )

        for i in range(total_frames):
            frame = self._apply_transition(img.copy(), total_frames)
            out.write(frame)

        out.release()

    def validate(self) -> bool:
        """Valide que la video generee est correcte."""
        if not os.path.exists(self.output_path):
            return False
        cap = cv2.VideoCapture(self.output_path)
        if not cap.isOpened():
            return False
        frame_count = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
        cap.release()
        return frame_count == self.duration * self.fps


# Exemple d'utilisation
if __name__ == "__main__":
    converter = ImageToVideo(
        input_path="./assets/input.jpg",
        output_path="./output/video.mp4",
        duration=3,
        fps=24,
        transition_type="fade",
    )
    converter.process()
    print("Video generee avec succes !")
    print(f"Validation : {converter.validate()}")
```

---

## 6. Bonnes pratiques pour deleguer a Mistral

### 1. **Precision du prompt**
- **Evitez** : "Genere une documentation."
- **Preferez** : "Genere une documentation pour la competence `VideoToWebGL` avec les sections suivantes : introduction, prerequis, installation, configuration, exemple d'utilisation, depannage, FAQ. Utilise un ton technique mais accessible."

### 2. **Structuration des sorties**
- Demandez des formats specifiques (YAML pour les templates, Markdown pour la documentation, Python pour le code).
- Exemple : "Fournis le template en YAML avec les sections : `name`, `description`, `title`, `labels`, `body` (avec sous-sections `need`, `proposal`, `area`, `validation`)."

### 3. **Validation des sorties**
- Toujours inclure une section de validation dans vos prompts pour Mistral.
- Exemple : "Ajoute une section 'Validation' avec des criteres clairs pour verifier que la documentation est complete."

### 4. **Integration avec les outils existants**
- Referencez les fichiers existants dans vos prompts pour eviter les doublons.
- Exemple : "Utilise le template `feature_request.yml` comme base pour generer un nouveau template."

### 5. **Iteration et feedback**
- Si la premiere sortie n'est pas parfaite, affinez le prompt en fonction des resultats.
- Exemple : "La documentation generee est trop technique. Reecris-la pour un public intermediaire en simplifiant les termes."

---

## 7. Exemples avances

### 7.1. Generer un rapport d'acceptation pour une competence
**Prompt** :
```markdown
Genere un rapport d'acceptation pour la competence `VideoToWebGL` en suivant le format de `docs/DELEGATED_DOCS_ACCEPTANCE.md`. Inclure :
- Objectif de la competence
- Criteres d'acceptation (ex: generation de video, compatibilite ComfyUI)
- Etapes de test
- Metriques de performance attendues
- Responsables et echeances
```

### 7.2. Creer un template de workflow pour ComfyUI
**Prompt** :
```markdown
Genere un template de workflow ComfyUI pour la competence `VideoToWebGL` avec les nuds suivants :
1. VideoLoader (charge une video)
2. VideoToWebGL (convertit la video en rendu WebGL)
3. WebGLOutput (exporte le rendu)
Fournis le JSON du workflow et une documentation minimale pour l'utiliser.
```

### 7.3. Rediger un guide de contribution pour une nouvelle competence
**Prompt** :
```markdown
Redige un guide de contribution pour ajouter une nouvelle competence `TextToVideo3D` dans le projet. Inclure :
- Etapes pour cloner le depot et installer les dependances
- Structure des dossiers pour une nouvelle competence
- Exemple de code minimal pour un nud ComfyUI
- Processus de validation et de test
- Instructions pour soumettre une PR
```

---

## 8. Ressources utiles

- [Documentation officielle de ComfyUI](https://docs.comfy.org/)
- [GitHub Actions pour les workflows CI/CD](https://docs.github.com/en/actions)
- [Markdown Guide](https://www.markdownguide.org/)
- [Exemples de templates GitHub](https://github.com/devspace/awesome-github-templates)

---

## 9. Annexes

### 9.1. Liste des competences existantes
| Competence | Description | Documentation |
|------------|-------------|---------------|
| `VideoToWebGL` | Convertit une video en rendu WebGL | [Lien](docs/VideoToWebGL.md) |
| `ImageToVideo` | Convertit une image en video | [Lien](docs/ImageToVideo.md) |
| `TextToVideo` | Genere une video a partir de texte | [Lien](docs/TextToVideo.md) |

### 9.2. Glossaire des termes techniques
- **ComfyUI** : Framework de nuds pour l'IA generative.
- **WebGL** : API JavaScript pour le rendu 3D dans les navigateurs.
- **CI/CD** : Integration et livraison continues.
- **VRAM** : Memoire video dediee.

---

*Derniere mise a jour : 2026-06-03*
*Responsable : [Votre Nom]*
