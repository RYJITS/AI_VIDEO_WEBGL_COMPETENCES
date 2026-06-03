--- title: Modele de demande de patch delegue a Mistral description: Comment demander a Mistral de proposer un patch pour le depot sans acces direct au systeme de fichiers ou a GitHub. ---

# Modele de demande de patch delegue a Mistral

Ce document explique comment formuler une demande claire et securisee pour qu'un assistant comme Mistral propose un patch pour ce depot. **Aucun acces direct n'est accorde** : vous devez copier-coller les instructions dans une issue GitHub ou un ticket dedie, puis Codex appliquera les modifications apres validation.

---

##  Quand utiliser ce modele ?

Utilisez ce modele pour demander une modification **locale et ciblee** du depot, par exemple :
- Correction d'une faute dans la documentation
- Ajout d'un exemple de code ou de workflow
- Mise a jour d'un script d'installation
- Correction d'une coquille dans un fichier Markdown
- Proposition d'une amelioration mineure dans un workflow existant

 **Ne pas utiliser** pour :
- Des modifications majeures ou architecturales
- L'ajout de nouvelles fonctionnalites complexes
- Des changements necessitant une validation etendue
- Des modifications impliquant des secrets ou des donnees sensibles

---

##  Structure de la demande

### 1. Contexte (obligatoire)
Decrivez brievement la situation actuelle et le probleme ou l'opportunite identifiee.

**Exemple :**
```markdown
Dans le fichier `docs/COMFYUI_SETUP_CHECKLIST.md`, la section sur l'installation de ComfyUI sous Windows mentionne une version obsolete de Python (3.9). La documentation officielle recommande desormais Python 3.11 pour les versions recentes de ComfyUI.
```

### 2. Objectif (obligatoire)
Expliquez clairement ce que vous souhaitez obtenir avec ce patch.

**Exemple :**
```markdown
L'objectif est de mettre a jour la documentation pour refleter la version recommandee de Python (3.11) et d'ajouter une note sur les dependances associees.
```

### 3. Fichiers concernes (obligatoire)
Listez les fichiers ou dossiers qui devraient etre modifies. Si possible, fournissez des extraits ou des liens vers les sections concernees.

**Exemple :**
```markdown
- `docs/COMFYUI_SETUP_CHECKLIST.md` (ligne 42 a 50)
- `README.md` (section "Prerequis", ligne 25)
```

### 4. Instructions pour Mistral (obligatoire)
Decrivez **precisement** ce que Mistral doit faire. Soyez specifique sur les modifications a apporter.

**Exemple :**
```markdown
1. Dans `docs/COMFYUI_SETUP_CHECKLIST.md` :
   - Remplacer "Python 3.9" par "Python 3.11" a la ligne 42.
   - Ajouter une note en dessous : "Pour les versions recentes de ComfyUI (0.9.x et ulterieures), Python 3.11 est requis. Voir [documentation officielle](https://docs.comfy.org)."

2. Dans `README.md` :
   - Mettre a jour la section "Prerequis" pour indiquer "Python 3.11" au lieu de "Python 3.9".
```

### 5. Validation attendue (obligatoire)
Decrivez comment vous ou un validateur pourrez verifier que le patch fonctionne comme prevu.

**Exemple :**
```markdown
- La documentation doit indiquer Python 3.11 comme version recommandee.
- Les liens vers la documentation officielle doivent etre corrects et accessibles.
- Aucune regression ne doit etre introduite dans les exemples ou les workflows.
```

### 6. Contexte technique (optionnel mais recommande)
Fournissez des details techniques pour aider Mistral a comprendre le contexte.

**Exemple :**
```markdown
- ComfyUI version 0.9.5 est la version stable actuelle.
- Les dependances Python pour ComfyUI incluent `torch` et `numpy`, qui necessitent Python 3.11.
- Le fichier `requirements.txt` doit etre mis a jour si necessaire.
```

### 7. Exemples ou references (optionnel)
Si applicable, fournissez des exemples de ce que le resultat final devrait ressembler.

**Exemple :**
```markdown
Voici un extrait de ce que devrait contenir la section mise a jour :

```
### Prerequis
- Python 3.11 (recommande pour ComfyUI 0.9.x et ulterieures)
- GPU NVIDIA avec CUDA 12.x
- 16 Go de RAM minimum
```
```

---

##  Exemple complet de demande

**Titre de l'issue :** `[Patch] Mise a jour de la version recommandee de Python pour ComfyUI`

**Corps de l'issue :**
```markdown
## Contexte
La documentation actuelle recommande Python 3.9 pour l'installation de ComfyUI, mais les versions recentes (0.9.x) necessitent Python 3.11.

## Objectif
Mettre a jour la documentation pour refleter la version recommandee de Python et ajouter une note sur les dependances associees.

## Fichiers concernes
- `docs/COMFYUI_SETUP_CHECKLIST.md` (section "Installation de ComfyUI")
- `README.md` (section "Prerequis")

## Instructions pour Mistral
1. Dans `docs/COMFYUI_SETUP_CHECKLIST.md` :
   - Remplacer "Python 3.9" par "Python 3.11" a la ligne 42.
   - Ajouter une note en dessous : "Pour les versions recentes de ComfyUI (0.9.x et ulterieures), Python 3.11 est requis. Voir [documentation officielle](https://docs.comfy.org)."

2. Dans `README.md` :
   - Mettre a jour la section "Prerequis" pour indiquer "Python 3.11" au lieu de "Python 3.9".

## Validation attendue
- La documentation doit indiquer Python 3.11 comme version recommandee.
- Les liens vers la documentation officielle doivent etre corrects et accessibles.
- Aucune regression ne doit etre introduite dans les exemples ou les workflows.

## Contexte technique
- ComfyUI version 0.9.5 est la version stable actuelle.
- Les dependances Python pour ComfyUI incluent `torch` et `numpy`, qui necessitent Python 3.11.
```

---

##  Checklist avant de soumettre la demande

- [ ] J'ai verifie que la modification demandee n'est pas deja presente dans le depot.
- [ ] J'ai lu la [documentation de delegation](docs/DELEGATION_OPERATING_MODEL.md) pour comprendre le processus.
- [ ] J'ai fourni des instructions **claires et precises** pour Mistral.
- [ ] J'ai liste tous les fichiers concernes par la modification.
- [ ] J'ai decrit comment valider que le patch fonctionne comme prevu.
- [ ] Je n'ai pas inclus de secrets, mots de passe ou donnees sensibles dans ma demande.
- [ ] J'ai utilise un titre d'issue clair et descriptif.

---

##  Processus apres soumission

1. **Reception de la demande** :
   - Votre demande sera analysee par l'equipe ou un validateur designe.
   - Si des clarifications sont necessaires, vous serez contacte.

2. **Generation du patch par Mistral** :
   - Mistral proposera un patch base sur vos instructions.
   - Le patch sera **valide par Codex** avant toute application.

3. **Validation et application** :
   - Vous ou un validateur pourrez verifier le patch avant application.
   - Une fois valide, le patch sera applique au depot.

4. **Fermeture de l'issue** :
   - L'issue sera fermee une fois le patch applique et valide.

---

##  Ressources utiles

- [Modele de delegation](docs/DELEGATION_OPERATING_MODEL.md)
- [Matrice de validation](docs/DELEGATION_VALIDATION_MATRIX.md)
- [Guide des issues GitHub](.github/ISSUE_TEMPLATE/bug_report.yml)
- [Documentation officielle du projet](https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES#readme)

---

##  Questions frequentes

**Q : Puis-je demander plusieurs modifications dans une seule issue ?**
R : Oui, mais assurez-vous que les modifications sont liees et peuvent etre validees ensemble. Pour des modifications complexes, preferez plusieurs issues.

**Q : Que faire si Mistral ne comprend pas ma demande ?**
R : Clarifiez votre demande en ajoutant des details ou des exemples. Vous pouvez aussi consulter la [matrice de validation](docs/DELEGATION_VALIDATION_MATRIX.md) pour vous assurer que votre demande est dans les limites acceptables.

**Q : Comment puis-je suivre l'avancement de ma demande ?**
R : Les issues GitHub permettent de suivre l'avancement. Vous serez notifie des changements ou des demandes de clarification.

**Q : Puis-je annuler une demande ?**
R : Oui, vous pouvez fermer l'issue a tout moment si vous n'avez plus besoin de la modification.

---

##  Notes importantes

- **Pas d'acces direct** : Mistral ne peut pas modifier directement le depot. Vous devez utiliser ce modele pour formuler une demande claire.
- **Validation obligatoire** : Tous les patches doivent etre valides par Codex avant application.
- **Respectez les limites** : Les modifications doivent etre mineures et ciblees. Pour des changements majeurs, utilisez le template [Feature request](.github/ISSUE_TEMPLATE/feature_request.yml).
- **Securite** : Ne partagez jamais de secrets, mots de passe ou donnees sensibles dans vos demandes.

---

*Derniere mise a jour : 2026-06-03*
*Ce document fait partie du projet AI_VIDEO_WEBGL_COMPETENCES.*
