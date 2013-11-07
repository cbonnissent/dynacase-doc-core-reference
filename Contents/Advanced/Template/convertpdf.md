# Vues de consultation avec transformation {#core-ref:cba45985-7153-4653-9259-d536e6336d87}

Il est conseillé de lire le chapitre sur les [vues][view] avant ce chapitre.

Il est possible de déclencher un mécanisme de transformation d'une vue après sa
consultation. C'est à dire d'utiliser le [moteur de transformation][te] pour
convertir le format d'une vue binaire ou textuel dans un autre format (par
exemple convertir un odt produit en pdf).

## Pré-requis {#core-ref:c29b0396-27cb-4b29-8b63-b83d68a357d2}

Il faut que le contexte sur lequel on souhaite mettre en place cette technique
puisse accéder à un [moteur de transformation][te] qui possède le 
[`engine`][engine] nécessaire pour effectuer cette transformation.

## Mise en place {#core-ref:e584c049-6a33-4f5a-987f-26e887d3845e}

Il suffit d'ajout en suffixe de [l'URL d'appel][view] l'engine voulu. Ce qui 
donne :

`?app=FDL&action=FDL_CARD&id=9&zone=FDL:viewperson.odt:B:pdf`

Ce qui permet de voir le document ayant l'identifiant n°9 avec la vue définie
par  `viewperson.odt` en binaire (fichier openDocument Text) et converti en pdf.

*Note* : l'option `B` dans le nom de la zone  est obligatoire pour utiliser la
transformation, car la vue utilisée doit retourner un nom de fichier et non un
contenu.

Par défaut le [moteur de transformation][te] met à disposition les 
[`engines`][engine] suivants :

* `pdf` : il peut être utilisé pour convertir un odt ou un HTML en pdf. 
**Attention** : toutefois la conversion du HTML reste assez basique et 
l'ensemble des propriétés CSS ne sont pas supportées,
* `pdfa` : il a les mêmes possibilités que le moteur pdf mais fourni un pdf prêt
pour archivage (avec inclusion des polices de caractères).

<!-- link -->
[view]:     #core-ref:d59a0b84-49c8-470b-8f38-fb138eb62be5
[te]:       https://docs.anakeen.com/dynacase/3.2/dynacase-doc-tengine-installation-operating/website/book/index.html "Installation et exploitation Tranformation Engine"
[engine]:   https://docs.anakeen.com/dynacase/3.2/dynacase-doc-tengine-installation-operating/website/book/gestion-des-engins.html "Gestion des engins de transformations"