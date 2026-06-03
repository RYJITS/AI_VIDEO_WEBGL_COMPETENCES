# Tests de Frontiere pour Mistral

Ce document definit les **tests de frontiere** a appliquer pour valider les delegations futures de Mistral dans le projet **AI_VIDEO_WEBGL_COMPETENCES**. Ces tests permettent d'identifier les limites de delegation, les scenarios limites, et les risques potentiels pour garantir que les contributions automatisees respectent les standards du projet.

---

## 1. Introduction

Les tests de frontiere visent a explorer les limites des delegations possibles pour Mistral, en identifiant :
- Les **scenarios ou Mistral peut deleguer** en toute securite.
- Les **scenarios ou Mistral ne doit pas deleguer** sans supervision.
- Les **risques potentiels** lies a une delegation non maitrisee.
- Les **bonnes pratiques** pour minimiser les erreurs.

### 1.1. Objectifs
- **Definir les limites** de delegation pour Mistral.
- **Documenter les risques** et les scenarios limites.
- **Fournir des outils** pour valider les contributions automatisees.
- **Ameliorer la confiance** dans les delegations futures.

### 1.2. Portee
Ce guide couvre les tests de frontiere pour :
- La **documentation** (README, CONTRIBUTING, etc.).
- Les **workflows ComfyUI** (JSON).
- Les **competences Cerveau Central** (COMPETENCE.md).
- Les **exemples video/contact sheets**.
- Les **scripts d'installation**.
- Les **issues GitHub** (bug reports, feature requests).

---

## 2. Tests de Frontiere par Type de Delegation

### 2.1. Documentation

#### Scenarios ou Mistral peut deleguer
| Scenario | Criteres de Validation | Outils/Preuves | Risque Potentiel |
|----------|------------------------|----------------|------------------|
| **Correction de fautes de frappe** | - Faute de frappe evidente (ex : `ComfyUI` au lieu de `ComfyUI`).
- Pas de modification du sens ou de la structure. | Verification manuelle ou `git diff` | Faible |
| **Amelioration de la clarte** | - Reformulation d'une phrase pour plus de clarte.
- Ajout d'un exemple ou d'une note explicative. | Validation par un tiers | Moyen |
| **Mise a jour de liens ou de chemins** | - Correction d'un lien casse ou d'un chemin relatif.
- Pas de modification des commandes ou des workflows. | Verification des liens | Faible |

#### Scenarios ou Mistral ne doit pas deleguer
| Scenario | Pourquoi ? | Alternative |
|----------|-------------|-------------|
| **Ajout de nouvelles sections** | Risque de desequilibre dans la structure ou de contenu non pertinent. | Ouvrir une issue avec le template `feature_request.yml` |
| **Modification des commandes ou des workflows** | Risque d'introduire des erreurs ou des incompatibilites. | Valider avec un contributeur humain |
| **Changement de licence ou de termes legaux** | Risque juridique. | Ouvrir une issue pour discussion |
| **Ajout de dependances lourdes** | Risque de bloquer des contributeurs ou d'alourdir le depot. | Ouvrir une issue avec justification |

#### Tests de Frontiere Recommandes
1. **Test de clarte** : Demander a Mistral de reformuler un paragraphe technique complexe. Verifier que le sens est preserve.
2. **Test de coherence** : Demander a Mistral de corriger une faute de frappe dans un fichier technique. Verifier que la correction ne modifie pas le comportement attendu.
3. **Test de liens** : Demander a Mistral de mettre a jour un lien casse. Verifier que le nouveau lien est valide.

**Exemple de commande pour valider une correction de documentation** :
```powershell
git diff -- docs/CONTRIBUTING.md
```

---

### 2.2. Workflows ComfyUI (JSON)

#### Scenarios ou Mistral peut deleguer
| Scenario | Criteres de Validation | Outils/Preuves | Risque Potentiel |
|----------|------------------------|----------------|------------------|
| **Correction de syntaxe JSON** | - Correction d'une erreur de syntaxe (ex : virgule manquante).
- Le JSON reste valide apres correction. | `ConvertFrom-Json` | Faible |
| **Ajout de commentaires** | - Ajout de commentaires dans le JSON pour expliquer des nuds complexes.
- Pas de modification de la logique du workflow. | Validation manuelle | Moyen |
| **Optimisation de nuds** | - Simplification d'un nud redondant.
- Le workflow reste fonctionnel et produit le meme resultat. | Test dans ComfyUI | Moyen |

#### Scenarios ou Mistral ne doit pas deleguer
| Scenario | Pourquoi ? | Alternative |
|----------|-------------|-------------|
| **Modification de la logique du workflow** | Risque de casser le workflow ou de produire un resultat incorrect. | Ouvrir une issue avec le template `workflow_request.yml` |
| **Ajout de nouveaux nuds ou modeles** | Risque d'introduire des dependances non documentees ou des incompatibilites. | Valider avec un contributeur humain |
| **Changement des parametres critiques** | Risque de modifier le comportement attendu (ex : nombre de steps, taille de l'image). | Valider avec un contributeur humain |

#### Tests de Frontiere Recommandes
1. **Test de syntaxe** : Demander a Mistral de corriger une erreur de syntaxe dans un workflow JSON. Verifier que le JSON est valide et que le workflow s'ouvre dans ComfyUI.
2. **Test d'optimisation** : Demander a Mistral d'optimiser un nud redondant. Verifier que le workflow reste fonctionnel et produit le meme resultat.
3. **Test de compatibilite** : Demander a Mistral de tester le workflow dans ComfyUI avec une version specifique. Verifier qu'il fonctionne sans erreur.

**Exemple de commande pour valider un workflow** :
```powershell
Get-Content .\examples\workflows\<fichier>.json | ConvertFrom-Json | Out-Null
```

---

### 2.3. Competences Cerveau Central (COMPETENCE.md)

#### Scenarios ou Mistral peut deleguer
| Scenario | Criteres de Validation | Outils/Preuves | Risque Potentiel |
|----------|------------------------|----------------|------------------|
| **Correction de fautes de frappe** | - Faute de frappe evidente dans le texte.
- Pas de modification du sens ou des exemples. | Validation manuelle | Faible |
| **Amelioration de la clarte** | - Reformulation d'une phrase pour plus de clarte.
- Ajout d'un exemple ou d'une note explicative. | Validation par un tiers | Moyen |
| **Mise a jour des metadonnees** | - Correction d'une version ou d'un lien vers un outil. | Verification manuelle | Faible |

#### Scenarios ou Mistral ne doit pas deleguer
| Scenario | Pourquoi ? | Alternative |
|----------|-------------|-------------|
| **Modification des exemples de workflows** | Risque de casser la compatibilite ou de produire un resultat incorrect. | Ouvrir une issue avec le template `workflow_request.yml` |
| **Ajout de nouvelles competences** | Risque de desequilibrer la structure ou d'introduire des dependances non documentees. | Ouvrir une issue avec le template `feature_request.yml` |
| **Changement des entrees/sorties** | Risque de modifier le comportement attendu de la competence. | Valider avec un contributeur humain |

#### Tests de Frontiere Recommandes
1. **Test de clarte** : Demander a Mistral de reformuler une section technique dans un fichier COMPETENCE.md. Verifier que le sens est preserve et que les exemples restent valides.
2. **Test de coherence** : Demander a Mistral de corriger une faute de frappe dans un fichier COMPETENCE.md. Verifier que la correction ne modifie pas le comportement attendu.
3. **Test de compatibilite** : Demander a Mistral de verifier qu'une competence est compatible avec une version specifique de ComfyUI. Confirmer avec un test local.

**Exemple de commande pour valider une competence** :
```powershell
Get-Content .\cerveau-competence\<competence>\COMPETENCE.md | Out-Null
```

---

### 2.4. Exemples Video/Contact Sheets

#### Scenarios ou Mistral peut deleguer
| Scenario | Criteres de Validation | Outils/Preuves | Risque Potentiel |
|----------|------------------------|----------------|------------------|
| **Compression d'une video** | - Reduction de la taille sans perte de qualite visible.
- La video reste utilisable comme preuve technique. | `ffprobe` + observation visuelle | Faible |
| **Ajout de metadonnees** | - Ajout de metadonnees manquantes (ex : modele utilise, FPS).
- Pas de modification du contenu video. | `ffprobe` | Faible |
| **Creation d'une contact sheet** | - Generation d'une image de contact sheet a partir d'une video.
- La contact sheet est claire et utile. | Observation visuelle | Moyen |

#### Scenarios ou Mistral ne doit pas deleguer
| Scenario | Pourquoi ? | Alternative |
|----------|-------------|-------------|
| **Modification du contenu video** | Risque de modifier la preuve technique ou d'introduire des artefacts. | Valider avec un contributeur humain |
| **Ajout de nouveaux exemples** | Risque de desequilibrer la structure ou d'introduire des contenus non pertinents. | Ouvrir une issue avec le template `feature_request.yml` |
| **Changement des parametres de generation** | Risque de modifier la qualite ou le style de la video. | Valider avec un contributeur humain |

#### Tests de Frontiere Recommandes
1. **Test de compression** : Demander a Mistral de compresser une video tout en conservant les metadonnees utiles. Verifier que la taille est reduite et que la qualite reste acceptable.
2. **Test de contact sheet** : Demander a Mistral de generer une contact sheet a partir d'une video. Verifier que la contact sheet est claire et utile.
3. **Test de metadonnees** : Demander a Mistral d'ajouter des metadonnees manquantes a une video. Verifier que les metadonnees sont correctes.

**Exemple de commande pour valider une video** :
```powershell
ffprobe -v error -show_entries stream=width,height,nb_frames,r_frame_rate,duration -of json .\examples\videos\<clip>.mp4
```

---

### 2.5. Scripts d'Installation

#### Scenarios ou Mistral peut deleguer
| Scenario | Criteres de Validation | Outils/Preuves | Risque Potentiel |
|----------|------------------------|----------------|------------------|
| **Correction de fautes de frappe** | - Faute de frappe evidente dans les messages ou les commentaires.
- Pas de modification de la logique du script. | Validation manuelle | Faible |
| **Ajout de verifications d'erreur** | - Ajout de verifications pour des erreurs courantes (ex : dependances manquantes).
- Le script reste fonctionnel. | Test local | Moyen |
| **Optimisation de commandes** | - Simplification d'une commande redondante.
- Le script reste fonctionnel. | Test local | Faible |

#### Scenarios ou Mistral ne doit pas deleguer
| Scenario | Pourquoi ? | Alternative |
|----------|-------------|-------------|
| **Modification de la logique d'installation** | Risque de casser l'installation ou d'introduire des incompatibilites. | Valider avec un contributeur humain |
| **Ajout de nouvelles dependances** | Risque d'introduire des dependances non documentees ou lourdes. | Ouvrir une issue avec le template `feature_request.yml` |
| **Changement des versions des outils** | Risque de modifier la compatibilite avec le projet. | Valider avec un contributeur humain |

#### Tests de Frontiere Recommandes
1. **Test de correction** : Demander a Mistral de corriger une faute de frappe dans un script d'installation. Verifier que le script reste fonctionnel.
2. **Test d'optimisation** : Demander a Mistral d'optimiser une commande redondante. Verifier que le script reste fonctionnel.
3. **Test de compatibilite** : Demander a Mistral de tester le script sur une nouvelle version de Python ou de Node. Confirmer que l'installation fonctionne.

**Exemple de commande pour valider un script** :
```powershell
.\[script_name].ps1 -Help
```

---

### 2.6. Issues GitHub

#### Scenarios ou Mistral peut deleguer
| Type d'Issue | Scenario | Criteres de Validation | Outils/Preuves | Risque Potentiel |
|--------------|----------|------------------------|----------------|------------------|
| **Bug Report** | Correction d'une faute de frappe dans les etapes de reproduction. | - La faute de frappe est evidente.
- Les etapes de reproduction restent claires. | Validation manuelle | Faible |
| **Feature Request** | Reformulation d'une proposition pour plus de clarte. | - La reformulation est plus claire.
- Le besoin et la proposition restent identiques. | Validation par un tiers | Moyen |
| **Question** | Ajout d'un exemple ou d'une clarification dans le contexte. | - L'exemple ou la clarification est utile.
- Le contexte reste pertinent. | Validation manuelle | Faible |

#### Scenarios ou Mistral ne doit pas deleguer
| Type d'Issue | Scenario | Pourquoi ? | Alternative |
|--------------|----------|-------------|-------------|
| **Bug Report** | Modification des etapes de reproduction ou du resultat attendu. | Risque de modifier la reproductibilite du bug. | Valider avec un contributeur humain |
| **Feature Request** | Ajout de nouvelles fonctionnalites ou de zones concernees. | Risque de desequilibrer la structure de l'issue. | Ouvrir une nouvelle issue |
| **Question** | Ajout de nouvelles questions ou de nouveaux contextes. | Risque de rendre l'issue trop longue ou non pertinente. | Ouvrir une nouvelle issue |

#### Tests de Frontiere Recommandes
1. **Test de clarte** : Demander a Mistral de reformuler une issue pour plus de clarte. Verifier que le sens est preserve et que l'issue reste utile.
2. **Test de correction** : Demander a Mistral de corriger une faute de frappe dans une issue. Verifier que la correction ne modifie pas le sens.
3. **Test de validation** : Demander a Mistral de verifier qu'une issue est complete et bien structuree. Confirmer avec un contributeur humain.

---

## 3. Processus de Validation des Tests de Frontiere

### 3.1. Etapes Generales
1. **Definir le scenario de test** : Choisir un type de delegation et un scenario specifique.
2. **Demander a Mistral d'appliquer la delegation** : Fournir des instructions claires et des exemples.
3. **Valider les resultats** : Verifier que les criteres de validation sont respectes.
4. **Documenter les resultats** : Noter les succes, les echecs, et les risques identifies.
5. **Ajuster les limites de delegation** : Mettre a jour ce guide en fonction des resultats.

### 3.2. Outils Recommandes
- **Validation JSON** : `ConvertFrom-Json` (PowerShell).
- **Validation des chemins** : Scripts PowerShell pour verifier l'absence de chemins absolus.
- **Validation des metadonnees video** : `ffprobe`.
- **Validation des workflows** : Ouverture dans ComfyUI.
- **Validation des scripts** : Execution locale.

### 3.3. Documentation des Resultats
Pour chaque test de frontiere, documenter :
- Le **scenario** teste.
- Les **criteres de validation** appliques.
- Les **resultats** (succes/echec).
- Les **risques identifies**.
- Les **ajustements recommandes** pour les futures delegations.

**Exemple de template pour documenter un test** :
```markdown
### Test : Correction de syntaxe JSON
- **Scenario** : Correction d'une virgule manquante dans un workflow JSON.
- **Criteres de validation** : Le JSON est valide apres correction, et le workflow s'ouvre dans ComfyUI.
- **Resultats** : Succes. Le JSON est valide, et le workflow s'ouvre sans erreur.
- **Risques identifies** : Aucun risque majeur.
- **Ajustements recommandes** : Aucune modification necessaire. Les corrections de syntaxe JSON peuvent etre deleguees en toute securite.
```

---

## 4. Risques Potentiels et Solutions

| Risque | Description | Solution |
|--------|-------------|----------|
| **Erreurs de syntaxe** | Mistral introduit une erreur de syntaxe dans un fichier technique. | Valider avec des outils automatises (ex : `ConvertFrom-Json`, `ffprobe`). |
| **Incompatibilites** | Mistral modifie un workflow ou un script de maniere incompatible. | Tester localement avant validation. |
| **Contenu non pertinent** | Mistral ajoute du contenu non pertinent ou hors sujet. | Valider avec un contributeur humain avant validation. |
| **Dependance non documentee** | Mistral ajoute une dependance non documentee ou lourde. | Verifier les dependances avant validation. |
| **Problemes de licence** | Mistral modifie des termes legaux ou de licence. | Valider avec un contributeur humain avant validation. |

---

## 5. Bonnes Pratiques pour les Delegations Futures

- **Commencer petit** : Deleguer des taches simples (ex : correction de fautes de frappe) avant de deleguer des taches complexes.
- **Valider systematiquement** : Toujours valider les resultats de Mistral avec des outils automatises ou des tests locaux.
- **Documenter les limites** : Mettre a jour ce guide en fonction des resultats des tests de frontiere.
- **Communiquer clairement** : Fournir des instructions precises et des exemples pour eviter les malentendus.
- **Surveiller les risques** : Identifier et documenter les risques potentiels pour chaque type de delegation.

---

## 6. Annexes

### 6.1. Exemple de Test de Frontiere Complete

**Cas** : Demander a Mistral de corriger une faute de frappe dans un fichier COMPETENCE.md.

1. **Scenario** :
   - Fichier : `cerveau-competence/competence-video-start-end-webgl/COMPETENCE.md`
   - Faute de frappe : `ComfyUI` ecrit `ComfyUI` (avec un 'y' en trop).

2. **Instructions pour Mistral** :
   - "Corrige la faute de frappe dans la ligne 42 du fichier COMPETENCE.md. La correction doit etre minimale et ne pas modifier le sens du texte."

3. **Validation** :
   - Verifier que la faute de frappe est corrigee.
   - Verifier que le sens du texte est preserve.
   - Verifier que le fichier reste valide (pas de corruption).

4. **Resultats** :
   - Succes : La faute de frappe est corrigee, et le fichier reste valide.
   - Risque identifie : Aucun risque majeur.

5. **Conclusion** :
   - Les corrections de fautes de frappe dans la documentation peuvent etre deleguees en toute securite.

### 6.2. Checklist pour les Tests de Frontiere

- [ ] Le scenario de test est clairement defini.
- [ ] Les criteres de validation sont documentes.
- [ ] Les outils de validation sont disponibles et utilises.
- [ ] Les resultats sont documentes (succes/echec/risques).
- [ ] Les ajustements pour les futures delegations sont identifies.

---

## 7. Conclusion

Ce guide des tests de frontiere pour Mistral permet de definir les limites de delegation pour chaque type de contribution dans le projet **AI_VIDEO_WEBGL_COMPETENCES**. En suivant ces tests, les contributeurs peuvent valider les delegations futures de Mistral en toute securite, tout en minimisant les risques et en garantissant la qualite des contributions automatisees.

Pour toute question ou amelioration de ce guide, ouvrir une issue avec le template `feature_request.yml` (Documentation).
