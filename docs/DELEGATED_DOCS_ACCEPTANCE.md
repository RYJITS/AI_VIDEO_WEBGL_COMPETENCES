## Criteres d'acceptation pour les fichiers de documentation generes par Mistral

Ce document definit les criteres d'acceptation pour les fichiers de documentation generes par Mistral dans le cadre du projet **AI_VIDEO_WEBGL_COMPETENCES**. Ces criteres visent a garantir la qualite, la coherence et l'integration des contributions automatisees dans le depot.

---

### 1. **Conformite au format ASCII**

- **Exigence** : Tous les fichiers generes doivent etre encodes en **ASCII pur** (sans caracteres Unicode ou UTF-8 etendus).
- **Validation** :
  - Utiliser la commande `file <fichier>` pour verifier l'encodage. Le resultat doit indiquer `ASCII text`.
  - Exemple de sortie attendue :
    ```
    docs/DELEGATED_DOCS_ACCEPTANCE.md: ASCII text
    ```
  - **Exception** : Les guillemets typographiques (` `, ` `) et les apostrophes courbes (``) sont autorises uniquement dans les citations ou les exemples de code, a condition qu'ils soient explicitement documentes comme tels.

---

### 2. **Taille des fichiers**

- **Exigence** : La taille des fichiers generes doit respecter les limites definies dans la politique du projet.
  - **Maximum** : 4 500 octets par fichier.
  - **Minimum** : 1 000 octets (sauf pour les fichiers de configuration ou les listes vides).
- **Validation** :
  - Utiliser la commande `wc -c <fichier>` pour verifier la taille en octets.
  - Exemple :
    ```bash
    wc -c docs/DELEGATED_DOCS_ACCEPTANCE.md
    # Resultat attendu : entre 1000 et 4500
    ```
  - **Note** : Les fichiers de moins de 1 000 octets doivent etre justifies (ex. : fichier de configuration minimaliste).

---

### 3. **Integration dans le depot**

- **Exigence** : Les fichiers generes doivent s'integrer naturellement dans la structure existante du depot.
- **Criteres** :
  - **Chemin** : Le fichier doit etre place dans le dossier `docs/` ou un sous-dossier pertinent (ex. : `docs/guides/`).
  - **Nom** : Le nom du fichier doit suivre la convention `DELEGATED_<TYPE>_<DESCRIPTION>.md` (ex. : `DELEGATED_DOCS_ACCEPTANCE.md`).
  - **Liens** : Si le fichier est reference dans d'autres documents (ex. : `README.md`, `CONTRIBUTING.md`), les liens doivent etre mis a jour.
- **Validation** :
  - Verifier que le fichier est liste dans le manifeste du projet (ex. : `.github/workflows/validate-repo.yml`).
  - Executer la commande `ls docs/` pour confirmer la presence du fichier.

---

### 4. **Contenu et structure**

- **Exigence** : Le contenu doit etre clair, concis et aligne avec les objectifs du projet.
- **Criteres** :
  - **Titre** : Le titre du fichier doit etre descriptif et inclure le prefixe `DELEGATED`.
  - **Structure** : Le fichier doit suivre une structure markdown standard avec des sections claires (ex. : `## Introduction`, `## Criteres d'acceptation`, `## Validation`).
  - **Exemples** : Si des exemples de code ou de configuration sont inclus, ils doivent etre testes et documentes.
  - **Langue** : Le contenu peut etre redige en francais ou en anglais, mais doit etre coherent dans tout le fichier.
- **Validation** :
  - Utiliser un validateur markdown (ex. : `markdownlint`) pour verifier la syntaxe.
  - Verifier que le fichier est lisible et comprehensible sans ambiguite.

---

### 5. **Criteres de validation automatisee**

- **Exigence** : Les fichiers generes doivent passer les verifications automatisees definies dans le depot.
- **Criteres** :
  - **Workflow GitHub** : Le fichier doit etre valide par le workflow `.github/workflows/validate-repo.yml`.
  - **Tests locaux** : Si des tests locaux sont definis (ex. : dans `LOCAL_VALIDATION.md`), le fichier doit les respecter.
  - **Linters** : Le fichier doit passer les linters configures (ex. : `markdownlint`, `textlint`).
- **Validation** :
  - Executer le workflow GitHub pour valider le fichier.
  - Utiliser les commandes locales definies dans `LOCAL_VALIDATION.md` pour une validation rapide.

---

### 6. **Processus de revue**

- **Exigence** : Tous les fichiers generes par Mistral doivent etre revus par un humain avant d'etre fusionnes dans la branche principale.
- **Criteres** :
  - **Revue par les pairs** : Le fichier doit etre revu par au moins un contributeur du projet.
  - **Commentaires** : Les commentaires de la revue doivent etre pris en compte avant la fusion.
  - **Documentation** : Les raisons des modifications doivent etre documentees dans le fichier ou dans l'issue associee.
- **Validation** :
  - Verifier que le fichier a ete revu via les commentaires GitHub ou les discussions dans les issues.
  - Confirmer que les modifications demandees ont ete appliquees.

---

### 7. **Metadonnees et conformite**

- **Exigence** : Les fichiers generes doivent inclure des metadonnees pertinentes et respecter les politiques du projet.
- **Criteres** :
  - **En-tete** : Le fichier doit inclure un en-tete markdown avec les metadonnees suivantes :
    ```markdown
    ---
    **Genere par** : Mistral (modele Codex)
    **Date de generation** : AAAA-MM-JJ
    **Version** : 1.0
    **Validation requise** : Oui
    ---
    ```
  - **Licence** : Le fichier doit respecter la licence du projet (ex. : MIT, Apache 2.0).
  - **Securite** : Aucun secret ou information sensible ne doit etre inclus dans le fichier.
- **Validation** :
  - Verifier que l'en-tete est present et correct.
  - Utiliser la commande `grep` pour rechercher des mots-cles sensibles :
    ```bash
    grep -i "password\|secret\|token" docs/DELEGATED_DOCS_ACCEPTANCE.md
    ```

---

### 8. **Documentation des dependances**

- **Exigence** : Si le fichier genere depend d'outils ou de bibliotheques externes, ces dependances doivent etre documentees.
- **Criteres** :
  - **Section dediee** : Une section `## Dependances` doit etre incluse si necessaire.
  - **Versions** : Les versions des outils ou bibliotheques doivent etre specifiees.
  - **Installation** : Les etapes d'installation doivent etre claires et testees.
- **Validation** :
  - Verifier que la section `## Dependances` est presente si le fichier en a besoin.
  - Confirmer que les etapes d'installation sont completes et fonctionnelles.

---

### 9. **Exemples et cas d'usage**

- **Exigence** : Si le fichier inclut des exemples ou des cas d'usage, ceux-ci doivent etre testes et documentes.
- **Criteres** :
  - **Exemples fonctionnels** : Les exemples de code ou de configuration doivent etre executables et produire le resultat attendu.
  - **Documentation** : Les exemples doivent etre accompagnes d'une explication claire.
  - **Validation** : Les exemples doivent etre testes dans l'environnement du projet.
- **Validation** :
  - Executer les exemples fournis et verifier les resultats.
  - Verifier que les explications sont completes et comprehensibles.

---

### 10. **Maintenance et evolutivite**

- **Exigence** : Les fichiers generes doivent etre maintenables et evolutifs.
- **Criteres** :
  - **Modularite** : Le fichier doit etre structure de maniere modulaire pour faciliter les mises a jour.
  - **Commentaires** : Les sections complexes doivent etre commentees.
  - **Tests** : Si des tests automatises sont definis, le fichier doit les respecter.
- **Validation** :
  - Verifier que le fichier est bien structure et modulaire.
  - Confirmer que les commentaires sont presents et utiles.

---

### Annexe : Outils de validation recommandes

| Outil               | Commande de validation                     | Description                                  |
|---------------------|--------------------------------------------|----------------------------------------------|
| `file`              | `file <fichier>`                           | Verifie l'encodage ASCII.                    |
| `wc`                | `wc -c <fichier>`                          | Verifie la taille en octets.                 |
| `markdownlint`      | `markdownlint <fichier>`                   | Valide la syntaxe markdown.                  |
| `grep`              | `grep -i "secret\|password" <fichier>`    | Recherche des mots-cles sensibles.           |
| Workflow GitHub     | `.github/workflows/validate-repo.yml`      | Valide le fichier via le workflow CI/CD.     |

---

### Historique des modifications

| Version | Date       | Auteur          | Modifications principales                     |
|---------|------------|-----------------|-----------------------------------------------|
| 1.0     | 2026-06-03 | Mistral (Codex) | Version initiale.                             |

---

### Licence

Ce document est distribue sous la licence **MIT**. Voir le fichier `LICENSING.md` pour plus de details.
