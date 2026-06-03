# Matrice de Validation des Delegations

Ce document definit les criteres de validation pour chaque type de delegation dans le projet **AI_VIDEO_WEBGL_COMPETENCES**. Il s'appuie sur les templates d'issues GitHub, les workflows de validation, et les bonnes pratiques documentees dans le depot.

---

## 1. Introduction

La delegation dans ce projet consiste a confier a un contributeur ou a un outil automatise (comme Mistral) la responsabilite de valider ou de generer des elements specifiques (documentation, workflows, competences, etc.). Cette matrice permet de standardiser les criteres de validation pour garantir la qualite et la coherence du depot.

### 1.1. Objectifs
- **Standardiser** les criteres de validation pour chaque type de delegation.
- **Reduire les erreurs** en formalisant les attentes pour les contributeurs et les outils.
- **Faciliter l'audit** en documentant les decisions de validation.
- **Ameliorer la tracabilite** en liant les criteres aux templates d'issues et aux workflows.

### 1.2. Portee
Cette matrice couvre les delegations suivantes :
- Documentation (README, CONTRIBUTING, etc.)
- Workflows ComfyUI (JSON)
- Competences Cerveau Central
- Exemples video/contact sheets
- Scripts d'installation
- Issues GitHub (bug reports, feature requests, etc.)

---

## 2. Criteres de Validation par Type de Delegation

### 2.1. Documentation

| Critere | Description | Preuve Requise | Template GitHub Associe | Workflow de Validation |
|---------|-------------|----------------|------------------------|-----------------------|
| **Clarte** | Le texte est comprehensible, sans ambiguite, et en francais clair. | Lecture par un tiers | `feature_request.yml` (Documentation) | Validation manuelle |
| **Exactitude** | Les informations techniques sont correctes et a jour. | Verification des commandes, versions, et chemins | `bug_report.yml` | Validation manuelle + `validate-repo.yml` |
| **Structure** | Le document suit une structure logique (titres, sections, listes). | Apercu visuel | `feature_request.yml` | Validation manuelle |
| **Chemins relatifs** | Tous les chemins sont relatifs au depot ou generiques. | Verification des chemins | `bug_report.yml` | Validation manuelle |
| **Absence de secrets** | Aucun secret, token, ou chemin prive n'est expose. | Verification manuelle | `bug_report.yml` | Validation manuelle |
| **Validation des exemples** | Les exemples de code ou de commandes fonctionnent. | Execution locale ou simulation | `feature_request.yml` | Validation manuelle |

**Exemple de validation pour `CONTRIBUTING.md`** :
- Verifier que les commandes PowerShell utilisent des chemins relatifs.
- Confirmer que les exemples de validation (`git status --short`, `ffprobe`) sont corrects.
- S'assurer que les termes techniques sont expliques ou standardises.

---

### 2.2. Workflows ComfyUI (JSON)

| Critere | Description | Preuve Requise | Template GitHub Associe | Workflow de Validation |
|---------|-------------|----------------|------------------------|-----------------------|
| **Validite JSON** | Le fichier est un JSON valide et bien forme. | `Get-Content .\examples\workflows\<fichier>.json | ConvertFrom-Json` | `workflow_request.yml` | `validate-repo.yml` |
| **Ouverture dans ComfyUI** | Le workflow s'ouvre sans erreur dans ComfyUI. | Capture d'ecran ou log | `workflow_request.yml` | Validation manuelle |
| **Absence de chemins absolus** | Tous les chemins sont relatifs ou generiques. | Verification manuelle | `bug_report.yml` | Validation manuelle |
| **Documentation integree** | Le workflow est documente dans un fichier SKILL.md ou COMPETENCE.md. | Lien vers la documentation | `feature_request.yml` | Validation manuelle |
| **Compatibilite** | Le workflow est compatible avec les versions de ComfyUI, Python, et Node indiquees. | Verification des versions | `workflow_request.yml` | Validation manuelle |
| **Performance** | Le workflow ne depasse pas les limites de temps ou de ressources raisonnables. | Logs ou observation | `bug_report.yml` | Validation manuelle |

**Exemple de validation pour un workflow** :
- Verifier que le JSON est valide avec `ConvertFrom-Json`.
- Ouvrir le workflow dans ComfyUI et confirmer qu'il s'affiche correctement.
- Verifier que les chemins des modeles ou des assets sont relatifs.

---

### 2.3. Competences Cerveau Central

| Critere | Description | Preuve Requise | Template GitHub Associe | Workflow de Validation |
|---------|-------------|----------------|------------------------|-----------------------|
| **Documentation complete** | Le fichier COMPETENCE.md decrit la competence, ses entrees/sorties, et ses limites. | Lecture du fichier | `feature_request.yml` (Competence Cerveau) | Validation manuelle |
| **Exemple fonctionnel** | Un exemple de workflow ou de script est fourni et fonctionne. | Capture d'ecran ou log | `workflow_request.yml` | Validation manuelle |
| **Compatibilite** | La competence est compatible avec les versions de ComfyUI et les outils du projet. | Verification des versions | `bug_report.yml` | Validation manuelle |
| **Absence de dependances lourdes** | Aucune dependance non standard ou lourde n'est ajoutee. | Verification du `package.json` ou equivalent | `feature_request.yml` | Validation manuelle |
| **Tests QA** | Des observations visuelles ou des logs sont fournis pour valider le resultat. | Fichiers de logs ou contact sheets | `bug_report.yml` | Validation manuelle |

**Exemple de validation pour une competence** :
- Verifier que le fichier COMPETENCE.md est complet et bien structure.
- Tester le workflow associe et confirmer qu'il produit le resultat attendu.
- Verifier que les logs ou les contact sheets sont fournis.

---

### 2.4. Exemples Video/Contact Sheets

| Critere | Description | Preuve Requise | Template GitHub Associe | Workflow de Validation |
|---------|-------------|----------------|------------------------|-----------------------|
| **Preuve utile** | La video ou la contact sheet prouve une decision technique ou une amelioration. | Observation visuelle | `feature_request.yml` (Exemple video/contact sheet) | Validation manuelle |
| **Metadonnees completes** | Les metadonnees (resolution, FPS, duree, modele utilise) sont fournies. | `ffprobe` ou logs | `bug_report.yml` | Validation manuelle |
| **Taille raisonnable** | La video ou l'image ne depasse pas une taille raisonnable pour le depot. | Verification de la taille | `feature_request.yml` | Validation manuelle |
| **Absence de contenu sensible** | Aucune image ou video sensible ou protegee n'est incluse. | Verification manuelle | `bug_report.yml` | Validation manuelle |

**Exemple de validation pour une video** :
- Utiliser `ffprobe` pour verifier les metadonnees.
- Confirmer que la video prouve une amelioration technique (ex : meilleure qualite, temps de generation reduit).
- Verifier que la taille est raisonnable (ex : < 10 Mo).

---

### 2.5. Scripts d'Installation

| Critere | Description | Preuve Requise | Template GitHub Associe | Workflow de Validation |
|---------|-------------|----------------|------------------------|-----------------------|
| **Compatibilite** | Le script fonctionne sur Windows et est compatible avec les versions de Python/Node indiquees. | Logs d'execution | `workflow_request.yml` | Validation manuelle |
| **Absence de secrets** | Aucun secret ou token n'est hardcode dans le script. | Verification manuelle | `bug_report.yml` | Validation manuelle |
| **Documentation** | Le script est documente dans un fichier README ou INSTALLATION.md. | Lien vers la documentation | `feature_request.yml` | Validation manuelle |
| **Gestion des erreurs** | Le script gere les erreurs courantes (ex : dependances manquantes). | Logs ou messages d'erreur | `bug_report.yml` | Validation manuelle |

**Exemple de validation pour un script** :
- Executer le script et verifier qu'il s'installe sans erreur.
- Verifier que les logs sont clairs et utiles.
- Confirmer que le script est documente.

---

### 2.6. Issues GitHub

| Type d'Issue | Criteres de Validation | Preuve Requise | Workflow de Validation |
|--------------|------------------------|----------------|-----------------------|
| **Bug Report** | - Probleme reproductible decrit clairement.
- Etapes de reproduction fournies.
- Resultat attendu et observe documentes.
- Environnement detaille (OS, GPU, versions). | Logs ou captures | Validation manuelle |
| **Feature Request** | - Besoin clairement explique.
- Proposition de solution detaillee.
- Zone concernee identifiee (Documentation, Skill, etc.).
- Validation attendue definie. | Documentation ou exemple | Validation manuelle |
| **Question** | - Question claire et precise.
- Contexte fourni (environnement, etapes suivies).
- Captures ou logs utiles ajoutes. | Logs ou captures | Validation manuelle |
| **Workflow Request** | - Contexte et objectif clairs.
- Configuration actuelle detaillee.
- Workflow souhaite decrit ou schematise.
- Erreurs ou blocages documentes.
- Verifications prealables cochees. | Logs ou fichiers de workflow | Validation manuelle |

---

## 3. Processus de Validation

### 3.1. Etapes Generales
1. **Verification initiale** : S'assurer que le fichier ou la contribution respecte les criteres de base (ex : validite JSON, absence de secrets).
2. **Validation technique** : Tester le workflow, executer le script, ou verifier la documentation.
3. **Validation manuelle** : Faire relire par un tiers ou utiliser les templates d'issues pour confirmer la clarte.
4. **Documentation** : Mettre a jour les fichiers de validation (ex : `LOCAL_VALIDATION.md`) si necessaire.
5. **Approbation** : Valider la contribution et fermer l'issue ou merger la PR.

### 3.2. Outils de Validation Automatises
- **Validation JSON** : Utiliser `validate-repo.yml` pour verifier la validite des fichiers JSON.
- **Validation des chemins** : Utiliser des scripts PowerShell pour verifier l'absence de chemins absolus.
- **Validation des metadonnees video** : Utiliser `ffprobe` pour extraire les metadonnees.

### 3.3. Validation Manuelle
- **Documentation** : Lire le texte et verifier la clarte et l'exactitude.
- **Workflows** : Ouvrir le workflow dans ComfyUI et confirmer qu'il fonctionne.
- **Competences** : Tester le workflow associe et verifier le resultat.
- **Videos** : Observer la video et verifier qu'elle prouve une amelioration technique.

---

## 4. Echecs de Validation Courants

| Type de Delegation | Echec Courant | Cause Racine | Solution |
|--------------------|---------------|--------------|----------|
| **Documentation** | Chemins absolus | Oubli de generalisation | Utiliser des chemins relatifs ou des variables d'environnement |
| **Workflows JSON** | JSON invalide | Erreur de syntaxe ou de structure | Valider avec `ConvertFrom-Json` |
| **Competences** | Workflow non fonctionnel | Dependances manquantes ou versions incompatibles | Tester localement et documenter les versions |
| **Videos** | Taille excessive | Video non compressee ou trop longue | Compresser la video ou utiliser une contact sheet |
| **Scripts** | Erreur d'execution | Dependances manquantes ou permissions | Documenter les prerequis et ajouter des verifications |
| **Issues GitHub** | Probleme non reproductible | Etapes de reproduction incompletes | Demander des logs ou des captures supplementaires |

---

## 5. Bonnes Pratiques pour les Contributeurs

- **Pour la documentation** : Utiliser des exemples concrets et des commandes testees.
- **Pour les workflows** : Fournir un workflow minimal et documente.
- **Pour les competences** : Inclure des logs ou des contact sheets pour valider le resultat.
- **Pour les videos** : Utiliser des formats legers (MP4, WebM) et compresser si necessaire.
- **Pour les scripts** : Documenter les prerequis et ajouter des verifications d'erreur.

---

## 6. Annexes

### 6.1. Exemple de Validation Complete

**Cas** : Ajout d'un workflow pour generer une video de 5 secondes avec un modele specifique.

1. **Verification initiale** :
   - Le JSON est valide (`ConvertFrom-Json`).
   - Aucun chemin absolu n'est present.
   - Le workflow est documente dans un fichier SKILL.md.

2. **Validation technique** :
   - Ouvrir le workflow dans ComfyUI et confirmer qu'il s'affiche.
   - Executer le workflow et verifier qu'il genere une video.
   - Utiliser `ffprobe` pour verifier les metadonnees de la video.

3. **Validation manuelle** :
   - Verifier que la video prouve une amelioration (ex : meilleure qualite, temps de generation reduit).
   - Confirmer que les logs sont clairs et utiles.

4. **Documentation** :
   - Mettre a jour le fichier `SKILL.md` avec les observations.

5. **Approbation** :
   - Valider la PR et fermer l'issue associee.

### 6.2. Checklist de Validation

- [ ] Le fichier ou la contribution respecte les criteres de base (ex : validite JSON, absence de secrets).
- [ ] Les outils de validation automatises ont ete executes avec succes.
- [ ] La validation manuelle a confirme le bon fonctionnement ou la clarte.
- [ ] La documentation a ete mise a jour si necessaire.
- [ ] Les logs ou preuves utiles ont ete fournis.

---

## 7. Conclusion

Cette matrice de validation des delegations permet de standardiser les criteres pour chaque type de contribution dans le projet **AI_VIDEO_WEBGL_COMPETENCES**. En suivant ces criteres, les contributeurs et les outils automatises (comme Mistral) peuvent valider les contributions de maniere coherente et efficace, garantissant ainsi la qualite et la fiabilite du depot.

Pour toute question ou amelioration de cette matrice, ouvrir une issue avec le template `feature_request.yml` (Documentation).
