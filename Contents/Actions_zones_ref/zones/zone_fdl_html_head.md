# `[ZONE FDL:HTMLHEAD]` {#core-ref:12d0c18a-bde3-4488-ab02-a4135d0f51c7}

## Description  {#core-ref:7dcbc62a-a394-4858-b816-b46e6e4b19c8}

Cette zone est l'entête générique des pages générées par Dynacase. 
Elle contient :

* l'entête de la page : balise `html`, `head` et `title`,
* insertion des assets : [CSS][addCssRef], [JS][addJsRef], [CSS inline][addCssCode] et [JS inline][addJsCode],
* la [favicon][dynacase_favico],
* une balise `body` ouvrante ayant la classe `core`.

## Paramètres {#core-ref:6a43daec-81fb-4899-894b-0dc102a8ed23}

 * title : La valeur de ce paramètre devient le contenu de la balise `title`

## Limites {#core-ref:bfa2d0cb-cc17-42a9-a756-8fd8989daf05}

Après avoir utilisé cette zone, il faut penser à fermer les balises `body` et 
`html`, soit manuellement, soit en utilisant la zone [`FDL:HTMLFOOT`][foot].

<!-- link -->

[addJsCode]:        #core-ref:49a8e28b-f286-45d7-b9e0-cc3591a8efde
[addCssCode]:       #core-ref:5480ed21-5027-45c3-9efe-3897784b8865
[addCssRef]:        #core-ref:4bba8a6b-8002-4c0a-8ac7-70d75b31b02b
[addJsRef]:         #core-ref:b4b041aa-2649-498d-ace7-52131053c7db
[dynacase_favico]:  #core-ref:9ffaeb64-eb77-4c10-ab37-ae5113781778
[foot]:             #core-ref:66c5ed31-3d0f-404d-a009-95dab2a2dbed