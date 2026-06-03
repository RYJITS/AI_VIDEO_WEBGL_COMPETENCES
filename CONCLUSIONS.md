# Conclusions Techniques

## Strategie Finale

La bonne methode n'est pas de demander une longue transformation en un seul prompt. Il faut decouper le storyboard en micro-transitions.

Pour chaque micro-transition:

1. Image start propre.
2. Image end propre.
3. Prompt court, mecanique, visuel.
4. Generation Wan/LTX.
5. QA visuelle.
6. Si valide, seulement ensuite integration WebGL.

## Regles De Prompt

### Eviter

- particles
- dust
- smoke
- haze
- fog
- liquid morph
- soft dissolve
- energy cloud
- abstract transformation

Ces mots ont favorise les nuages de particules, le flou et les deformations.

### Preferer

- hard-edged graphite plates
- rigid black metal fragments
- precise amber seams
- mechanical assembly
- solid geometric chunks
- crisp engraved panels
- clean cinematic lighting

## Cadrage WebGL

Erreur observee: video 16:9 avec une zone noire dure a gauche. Le modele peut traiter cette zone comme une surface ou un masque, et l'animation semble passer dessous ou etre coupee.

Solution retenue:

- Video 16:9 continue.
- Fond sombre cinematic, pas de rectangle noir dur.
- Sujet dans les deux tiers droits.
- Texte/UI/WebGL ajoutes par le site sur la gauche.

## Qualite vs Vitesse

Le test step sweep montre:

- 10 steps: rapide, utile uniquement pour verifier le mouvement.
- 12 steps: encore trop flou.
- 14 steps: premier seuil acceptable.
- 16 steps: meilleur compromis.
- 18/20 steps: gain faible, temps plus long.

## Recommendation

Pour un vrai storyboard:

1. Faire les keyframes d'abord.
2. Evaluer la complexite.
3. Estimer les microclips.
4. Generer un pilote.
5. Valider.
6. Lancer le batch.
