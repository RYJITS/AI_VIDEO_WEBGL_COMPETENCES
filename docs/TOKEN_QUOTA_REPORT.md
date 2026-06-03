# TOKEN_QUOTA_REPORT

## Experience de quota de delegation

Ce document decrit lexperience en cours de **quota de delegation** appliquee entre **Codex** (lagent principal) et **Mistral** (lagent subordonne). Lobjectif est de limiter la generation de fichiers par Mistral pour eviter une surcharge ou une perte de controle dans le projet **AI_VIDEO_WEBGL_COMPETENCES**.

---

## Cibles et regles

### 1. Quota principal : < 49 %
- **Codex** doit conserver **plus de 51 %** des actions directes (creation, modification, validation).
- **Mistral** ne peut pas depasser **49 %** des actions globales dans une session ou un projet.
- Ce quota est calcule en temps reel sur les actions validees par Codex.

### 2. Role de Mistral
- **Generation de fichiers** : Mistral peut proposer des fichiers ou des correctifs, mais **Codex doit les valider explicitement** avant application.
- **Validation mecanique** : Les fichiers generes par Mistral sont soumis a une validation automatique (ex : format, taille, conformite aux regles du projet).
- **Limites strictes** :
  - **4 fichiers maximum** par demande.
  - **4000 octets maximum** par fichier.
  - **7000 octets maximum** de contexte partage.
  - **20 fichiers manifestes** maximum par projet.

### 3. Regles futures (a venir)
- **Une tache par unite deleguee** : A terme, chaque unite de travail deleguee a Mistral (ex : generation dun fichier, correction) devra correspondre a **une seule tache atomique**. Par exemple :
  -  **Autorise** : Corriger une faute de frappe dans un fichier.
  -  **Interdit** : Generer 3 fichiers en une seule demande.

---

## Processus actuel

1. **Demande initiale** : Codex formule une demande precise (ex : "Creer un fichier de documentation sur X").
2. **Generation par Mistral** : Mistral propose un fichier ou un correctif dans les limites autorisees.
3. **Validation par Codex** : Codex verifie le contenu, la conformite et les limites avant application.
4. **Application ou rejet** : Le fichier est applique ou rejete avec feedback.

---

## Exemples concrets

###  Cas valide
- **Demande** : "Creer un fichier `docs/TOKEN_QUOTA_REPORT.md` pour documenter le quota de delegation."
- **Action Mistral** : Generation du fichier avec le contenu demande.
- **Validation Codex** : Verification du contenu, des limites (taille, format) et application.

###  Cas invalide
- **Demande** : "Corriger les fautes dans 5 fichiers differents et en generer 2 nouveaux."
- **Action Mistral** : Tentative de generation de 7 fichiers.
- **Rejet automatique** : La demande depasse le quota de 4 fichiers et la regle des 4000 octets par fichier.

---

## Limites techniques

- **Taille des fichiers** : Aucun fichier ne doit depasser **4000 octets** (hors manifestes).
- **Contexte partage** : Le contexte total (fichiers inclus + instructions) ne doit pas exceder **7000 octets**.
- **Nombre de fichiers** : Maximum **4 fichiers** par demande.
- **Validation automatique** : Les fichiers generes sont soumis a une validation mecanique (ex : verification de la taille, du format Markdown, et de la conformite aux regles du projet).

---

## Bonnes pratiques

- **Precision des demandes** : Codex doit formuler des demandes **atomiques** et **limitees** pour eviter les rejets.
- **Feedback immediat** : Tout rejet doit etre accompagne dune explication claire (ex : "Trop de fichiers", "Taille depassee").
- **Documentation a jour** : Ce fichier (`TOKEN_QUOTA_REPORT.md`) doit etre mis a jour en cas devolution des regles.

---

## Regles de securite

- **Pas de secrets** : Aucun secret (cles API, mots de passe) ne doit etre inclus dans les fichiers generes.
- **Validation manuelle** : Codex doit toujours valider manuellement le contenu avant application, meme si la validation mecanique est passee.
- **Respect des politiques** : Les fichiers generes doivent respecter les politiques du projet (ex : pas de code non securise, pas de dependances non documentees).

---

## Historique des modifications

| Version | Date       | Auteur       | Modifications principales                     |
|---------|------------|--------------|-----------------------------------------------|
| 1.0     | 2026-06-03 | Mistral      | Creation du document                          |

---

## Annexes

- **Fichiers manifestes** : Liste des fichiers critiques du projet (ex : `.github/workflows/validate-repo.yml`).
- **Politique de delegation** : Regles detaillees dans les fichiers de configuration du projet.
- **Exemples de validation** : Voir `docs/KNOWN_LIMITS.md` pour les limites connues.

---

*Ce document est genere automatiquement et doit etre mis a jour manuellement en cas devolution des regles.*
