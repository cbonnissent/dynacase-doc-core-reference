# Vues de consultation avec transformation

Il est conseillé de lire le chapitre sur les [vues][view] avant ce chapitre.

Il est possible de déclencher un mécanisme de transformation d'une vue après sa
consultation. C'est à dire d'utiliser le [moteur de transformation][te] pour 
convertir le format d'une vue binaire ou textuel dans un autre format (par exemple
convertir un odt produit en pdf).

## Pré-requis

Il faut que le contexte sur lequel on souhaite mettre en place cette technique
puisse accéder à un [moteur de transformation][te] qui possède le 
[`engine`][engine] nécessaire pour effectuer cette transformation.

## Mise en place

Il suffit d'ajout en suffixe de [l'URL d'appel][view] l'engine voulu. Ce qui 
donne :

`?app=FDL&action=FDL_CARD&id=9&zone=FDL:viewperson.odt:B:pdf`

Ce qui permet de voir le document ayant l'id 9 avec la vue définie par 
`viewperson.odt` en binaire et converti en pdf.

Par défaut le [moteur de transformation][te] met à disposition les 
[`engines`][engine] suivants :

* `pdf` : il peut être utilisé pour convertir un odt ou un HTML en pdf. 
**Attention** : toutefois la conversion du HTML reste assez basique et 
l'ensemble des propriétés CSS ne sont pas supportées,
* `pdfa` : il a les mêmes possibilités que le moteur pdf mais fourni un pdf prêt
pour archivage (avec inclusion des polices de caractères).

[view]:     #core-ref:d59a0b84-49c8-470b-8f38-fb138eb62be5
[te]:       https://docs.anakeen.com/dynacase/3.2/dynacase-doc-tengine-installation-operating/website/book/index.html
[engine]:   https://docs.anakeen.com/dynacase/3.2/dynacase-doc-tengine-installation-operating/website/book/gestion-des-engins.html