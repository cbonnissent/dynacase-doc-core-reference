# Le modèle objet de Dynacase {#core-ref:4ac4e868-8398-44b7-b11a-5d26937ce186}

## Les classes standard de Dynacase Core {#core-ref:a963f527-cd8a-4050-abc1-608c0d4c7709}

Dynacase repose sur le modèle objet suivant :

<div class="uml classes">

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="389pt" style="width:395px;height:389px;" version="1.1" viewBox="0 0 395 389" width="395pt"><defs><filter height="300%" id="f1" width="300%" x="-1" y="-1"><feGaussianBlur result="blurOut" stdDeviation="2"/><feColorMatrix in="blurOut" result="blurOut2" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .4 0"/><feOffset dx="4" dy="4" in="blurOut2" result="blurOut3"/><feBlend in="SourceGraphic" in2="blurOut3" mode="normal"/></filter></defs><g><rect fill="#FEFECE" filter="url(#f1)" height="48" style="stroke: #A80036; stroke-width: 1.5;" width="69" x="122" y="8"/><ellipse cx="137" cy="24" fill="#ADD1B2" rx="11" ry="11" style="stroke: #A80036; stroke-width: 1.0;"/><path d="M139.9688,29.6406 Q139.3906,29.9375 138.75,30.0859 Q138.1094,30.2344 137.4063,30.2344 Q134.9063,30.2344 133.5859,28.5859 Q132.2656,26.9375 132.2656,23.8125 Q132.2656,20.6875 133.5859,19.0313 Q134.9063,17.375 137.4063,17.375 Q138.1094,17.375 138.7578,17.5313 Q139.4063,17.6875 139.9688,17.9844 L139.9688,20.7031 Q139.3438,20.125 138.75,19.8516 Q138.1563,19.5781 137.5313,19.5781 Q136.1875,19.5781 135.5,20.6484 Q134.8125,21.7188 134.8125,23.8125 Q134.8125,25.9063 135.5,26.9766 Q136.1875,28.0469 137.5313,28.0469 Q138.1563,28.0469 138.75,27.7734 Q139.3438,27.5 139.9688,26.9219 L139.9688,29.6406 Z "/><text fill="#000000" font-size="12" lengthAdjust="spacingAndGlyphs" textLength="37" x="151" y="29.0156">DbObj</text><line style="stroke: #A80036; stroke-width: 1.5;" x1="123" x2="190" y1="40" y2="40"/><line style="stroke: #A80036; stroke-width: 1.5;" x1="123" x2="190" y1="48" y2="48"/><rect fill="#FEFECE" filter="url(#f1)" height="48" style="stroke: #A80036; stroke-width: 1.5;" width="56" x="128" y="116"/><ellipse cx="143" cy="132" fill="#ADD1B2" rx="11" ry="11" style="stroke: #A80036; stroke-width: 1.0;"/><path d="M145.9688,137.6406 Q145.3906,137.9375 144.75,138.0859 Q144.1094,138.2344 143.4063,138.2344 Q140.9063,138.2344 139.5859,136.5859 Q138.2656,134.9375 138.2656,131.8125 Q138.2656,128.6875 139.5859,127.0313 Q140.9063,125.375 143.4063,125.375 Q144.1094,125.375 144.7578,125.5313 Q145.4063,125.6875 145.9688,125.9844 L145.9688,128.7031 Q145.3438,128.125 144.75,127.8516 Q144.1563,127.5781 143.5313,127.5781 Q142.1875,127.5781 141.5,128.6484 Q140.8125,129.7188 140.8125,131.8125 Q140.8125,133.9063 141.5,134.9766 Q142.1875,136.0469 143.5313,136.0469 Q144.1563,136.0469 144.75,135.7734 Q145.3438,135.5 145.9688,134.9219 L145.9688,137.6406 Z "/><text fill="#000000" font-size="12" lengthAdjust="spacingAndGlyphs" textLength="24" x="157" y="137.0156">Doc</text><line style="stroke: #A80036; stroke-width: 1.5;" x1="129" x2="183" y1="148" y2="148"/><line style="stroke: #A80036; stroke-width: 1.5;" x1="129" x2="183" y1="156" y2="156"/><rect fill="#FEFECE" filter="url(#f1)" height="48" style="stroke: #A80036; stroke-width: 1.5;" width="82" x="6" y="224"/><ellipse cx="21" cy="240" fill="#ADD1B2" rx="11" ry="11" style="stroke: #A80036; stroke-width: 1.0;"/><path d="M23.9688,245.6406 Q23.3906,245.9375 22.75,246.0859 Q22.1094,246.2344 21.4063,246.2344 Q18.9063,246.2344 17.5859,244.5859 Q16.2656,242.9375 16.2656,239.8125 Q16.2656,236.6875 17.5859,235.0313 Q18.9063,233.375 21.4063,233.375 Q22.1094,233.375 22.7578,233.5313 Q23.4063,233.6875 23.9688,233.9844 L23.9688,236.7031 Q23.3438,236.125 22.75,235.8516 Q22.1563,235.5781 21.5313,235.5781 Q20.1875,235.5781 19.5,236.6484 Q18.8125,237.7188 18.8125,239.8125 Q18.8125,241.9063 19.5,242.9766 Q20.1875,244.0469 21.5313,244.0469 Q22.1563,244.0469 22.75,243.7734 Q23.3438,243.5 23.9688,242.9219 L23.9688,245.6406 Z "/><text fill="#000000" font-size="12" lengthAdjust="spacingAndGlyphs" textLength="50" x="35" y="245.0156">DocFam</text><line style="stroke: #A80036; stroke-width: 1.5;" x1="7" x2="87" y1="256" y2="256"/><line style="stroke: #A80036; stroke-width: 1.5;" x1="7" x2="87" y1="264" y2="264"/><rect fill="#FEFECE" filter="url(#f1)" height="48" style="stroke: #A80036; stroke-width: 1.5;" width="67" x="123" y="224"/><ellipse cx="138" cy="240" fill="#ADD1B2" rx="11" ry="11" style="stroke: #A80036; stroke-width: 1.0;"/><path d="M140.9688,245.6406 Q140.3906,245.9375 139.75,246.0859 Q139.1094,246.2344 138.4063,246.2344 Q135.9063,246.2344 134.5859,244.5859 Q133.2656,242.9375 133.2656,239.8125 Q133.2656,236.6875 134.5859,235.0313 Q135.9063,233.375 138.4063,233.375 Q139.1094,233.375 139.7578,233.5313 Q140.4063,233.6875 140.9688,233.9844 L140.9688,236.7031 Q140.3438,236.125 139.75,235.8516 Q139.1563,235.5781 138.5313,235.5781 Q137.1875,235.5781 136.5,236.6484 Q135.8125,237.7188 135.8125,239.8125 Q135.8125,241.9063 136.5,242.9766 Q137.1875,244.0469 138.5313,244.0469 Q139.1563,244.0469 139.75,243.7734 Q140.3438,243.5 140.9688,242.9219 L140.9688,245.6406 Z "/><text fill="#000000" font-size="12" lengthAdjust="spacingAndGlyphs" textLength="35" x="152" y="245.0156">WDoc</text><line style="stroke: #A80036; stroke-width: 1.5;" x1="124" x2="189" y1="256" y2="256"/><line style="stroke: #A80036; stroke-width: 1.5;" x1="124" x2="189" y1="264" y2="264"/><rect fill="#FEFECE" filter="url(#f1)" height="48" style="stroke: #A80036; stroke-width: 1.5;" width="117" x="224" y="224"/><ellipse cx="239" cy="240" fill="#ADD1B2" rx="11" ry="11" style="stroke: #A80036; stroke-width: 1.0;"/><path d="M241.9688,245.6406 Q241.3906,245.9375 240.75,246.0859 Q240.1094,246.2344 239.4063,246.2344 Q236.9063,246.2344 235.5859,244.5859 Q234.2656,242.9375 234.2656,239.8125 Q234.2656,236.6875 235.5859,235.0313 Q236.9063,233.375 239.4063,233.375 Q240.1094,233.375 240.7578,233.5313 Q241.4063,233.6875 241.9688,233.9844 L241.9688,236.7031 Q241.3438,236.125 240.75,235.8516 Q240.1563,235.5781 239.5313,235.5781 Q238.1875,235.5781 237.5,236.6484 Q236.8125,237.7188 236.8125,239.8125 Q236.8125,241.9063 237.5,242.9766 Q238.1875,244.0469 239.5313,244.0469 Q240.1563,244.0469 240.75,243.7734 Q241.3438,243.5 241.9688,242.9219 L241.9688,245.6406 Z "/><text fill="#000000" font-size="12" lengthAdjust="spacingAndGlyphs" textLength="85" x="253" y="245.0156">DocCollection</text><line style="stroke: #A80036; stroke-width: 1.5;" x1="225" x2="340" y1="256" y2="256"/><line style="stroke: #A80036; stroke-width: 1.5;" x1="225" x2="340" y1="264" y2="264"/><rect fill="#FEFECE" filter="url(#f1)" height="48" style="stroke: #A80036; stroke-width: 1.5;" width="49" x="203" y="332"/><ellipse cx="218" cy="348" fill="#ADD1B2" rx="11" ry="11" style="stroke: #A80036; stroke-width: 1.0;"/><path d="M220.9688,353.6406 Q220.3906,353.9375 219.75,354.0859 Q219.1094,354.2344 218.4063,354.2344 Q215.9063,354.2344 214.5859,352.5859 Q213.2656,350.9375 213.2656,347.8125 Q213.2656,344.6875 214.5859,343.0313 Q215.9063,341.375 218.4063,341.375 Q219.1094,341.375 219.7578,341.5313 Q220.4063,341.6875 220.9688,341.9844 L220.9688,344.7031 Q220.3438,344.125 219.75,343.8516 Q219.1563,343.5781 218.5313,343.5781 Q217.1875,343.5781 216.5,344.6484 Q215.8125,345.7188 215.8125,347.8125 Q215.8125,349.9063 216.5,350.9766 Q217.1875,352.0469 218.5313,352.0469 Q219.1563,352.0469 219.75,351.7734 Q220.3438,351.5 220.9688,350.9219 L220.9688,353.6406 Z "/><text fill="#000000" font-size="12" lengthAdjust="spacingAndGlyphs" textLength="17" x="232" y="353.0156">Dir</text><line style="stroke: #A80036; stroke-width: 1.5;" x1="204" x2="251" y1="364" y2="364"/><line style="stroke: #A80036; stroke-width: 1.5;" x1="204" x2="251" y1="372" y2="372"/><rect fill="#FEFECE" filter="url(#f1)" height="48" style="stroke: #A80036; stroke-width: 1.5;" width="100" x="286" y="332"/><ellipse cx="301" cy="348" fill="#ADD1B2" rx="11" ry="11" style="stroke: #A80036; stroke-width: 1.0;"/><path d="M303.9688,353.6406 Q303.3906,353.9375 302.75,354.0859 Q302.1094,354.2344 301.4063,354.2344 Q298.9063,354.2344 297.5859,352.5859 Q296.2656,350.9375 296.2656,347.8125 Q296.2656,344.6875 297.5859,343.0313 Q298.9063,341.375 301.4063,341.375 Q302.1094,341.375 302.7578,341.5313 Q303.4063,341.6875 303.9688,341.9844 L303.9688,344.7031 Q303.3438,344.125 302.75,343.8516 Q302.1563,343.5781 301.5313,343.5781 Q300.1875,343.5781 299.5,344.6484 Q298.8125,345.7188 298.8125,347.8125 Q298.8125,349.9063 299.5,350.9766 Q300.1875,352.0469 301.5313,352.0469 Q302.1563,352.0469 302.75,351.7734 Q303.3438,351.5 303.9688,350.9219 L303.9688,353.6406 Z "/><text fill="#000000" font-size="12" lengthAdjust="spacingAndGlyphs" textLength="68" x="315" y="353.0156">DocSearch</text><line style="stroke: #A80036; stroke-width: 1.5;" x1="287" x2="385" y1="364" y2="364"/><line style="stroke: #A80036; stroke-width: 1.5;" x1="287" x2="385" y1="372" y2="372"/><path d="M156,76.291 C156,89.817 156,104.184 156,115.844 " fill="none" style="stroke: #A80036; stroke-width: 1.0; stroke-dasharray: 7.0,7.0;"/><polygon fill="none" points="149,76.237,156,56.237,163,76.237,149,76.237" style="stroke: #A80036; stroke-width: 1.0;"/><path d="M117.087,178.556 C101.846,193.657 84.8292,210.518 71.3801,223.844 " fill="none" style="stroke: #A80036; stroke-width: 1.0; stroke-dasharray: 7.0,7.0;"/><polygon fill="none" points="112.404,173.342,131.538,164.237,122.258,183.287,112.404,173.342" style="stroke: #A80036; stroke-width: 1.0;"/><path d="M156,184.291 C156,197.817 156,212.184 156,223.844 " fill="none" style="stroke: #A80036; stroke-width: 1.0;"/><polygon fill="none" points="149,184.237,156,164.237,163,184.237,149,184.237" style="stroke: #A80036; stroke-width: 1.0;"/><path d="M199.61,177.38 C217.573,192.777 237.866,210.171 253.818,223.844 " fill="none" style="stroke: #A80036; stroke-width: 1.0;"/><polygon fill="none" points="194.906,182.568,184.277,164.237,204.018,171.938,194.906,182.568" style="stroke: #A80036; stroke-width: 1.0;"/><path d="M260.425,290.3649 C253.256,304.4428 245.523,319.6283 239.302,331.8436 " fill="none" style="stroke: #A80036; stroke-width: 1.0; stroke-dasharray: 7.0,7.0;"/><polygon fill="none" points="254.343,286.8827,269.657,272.237,266.819,293.236,254.343,286.8827" style="stroke: #A80036; stroke-width: 1.0;"/><path d="M303.182,290.3649 C310.221,304.4428 317.814,319.6283 323.922,331.8436 " fill="none" style="stroke: #A80036; stroke-width: 1.0; stroke-dasharray: 7.0,7.0;"/><polygon fill="none" points="296.802,293.2564,294.119,272.237,309.324,286.9953,296.802,293.2564" style="stroke: #A80036; stroke-width: 1.0;"/></g></svg>

</div>

Ce schéma présente une version simplifiée des héritages
(les relations en pointillés omettent volontairement des classes intermédiaires).

Voici une brève explication des différentes classes.

### DbObj {#core-ref:1e07e79d-3760-4d8b-9e41-95c3fb63af08}

La classe `DbObj` sert à la persistance de données.
On peut la voir comme une une sorte d'[ORM][WP_ORM].

Son fonctionnement est détaillé dans la partie correspondante des
[techniques avancées][advanced_dbobj].

### Doc {#core-ref:4c82b0f5-2c3f-418d-8f03-dcefd5c4086a}

La classe `Doc` est la classe de base des documents Dynacase.

Tous les documents héritent de la classe `Doc`.

### DocFam {#core-ref:840462f3-4ea0-4e62-ad20-43d2dbfb2f64}

La classe `DocFam` est la classe d'une famille de documents.

Ainsi, une famille de document est aussi un type de document particulier,
ce qui permet de la manipuler comme tel.

### WDoc {#core-ref:c81391ba-8396-4c27-add7-9ddbe39c944f}

La classe `WDoc` est la classe de base des cycles de vie.

Tous les cycles de vie héritent de la classe `WDoc`.

### DocCollection {#core-ref:daece1b9-d710-46dc-85b6-16baa97322ab}

La classe `DocCollection` est la classe de base des collections.
Une collection est un ensemble de documents.

### Dir {#core-ref:977910df-1dc1-4def-9e0b-fb938f5d849f}

La classe `Dir` est la classe d'un dossier.

Un dossier est une collection statique de documents,
à laquelle on peut ajouter ou supprimer des documents.

### DocSearch {#core-ref:237dc350-14d4-45b0-8123-88a5a0976f1a}

La classe `DocSearch` est la classe de base des recherches.

Une recherche est une collection dynamique de documents,
dont le contenu est calculé dynamiquement à chaque accès en fonction
des critères de la recherche.

## Les Hooks {#core-ref:8f3d47de-32b5-4748-8a00-b1569c5423e5}

Le document offre de nombreux [hooks][WP_hooks] permettant de modifier son 
comportement au cours des étapes telles que la création, modification, 
suppression, etc. de document.

Ces hooks viennent s'ajouter aux droits de l'utilisateur.
Par exemple, lors de la création d'un document, Dynacase vérifiera d'abord
que l'utilisateur a bien le droit de créer un document de la famille concernée,
puis vérifiera ensuite que le hook `Doc::preCreated` ne bloque pas cette création.

### Création de document

Les méthode surchargeables appelées lors de la création d'un document sont :

*   Lors de la création avec `Doc::store`
    *   `Doc::preCreated`
    *   `Doc::postCreated`
    *   `Doc::specRefresh`
    *   `Doc::postModify`
*   Lors de la création avec `Doc::add`
    *   `Doc::preCreated`
    *   `Doc::postCreated`

### Modification de document

Les méthode surchargeables appelées lors de la modification d'un document sont :

*   Lors de la modification avec `Doc::store`
    *   `Doc::specRefresh`
    *   `Doc::postModify`
*   Lors de la modification avec `Doc::modify`
    *   aucune

### Suppression de document

Les méthode surchargeables appelées lors de la suppression d'un document 
avec `Doc::delete` sont :

*   `Doc::preDelete`
*   `Doc::postDelete`

### Duplication de document

Les méthode surchargeables appelées lors de la duplication d'un document 
avec `Doc::copy`

*   `Doc::preCopy`
*   `Doc::postCopy`

### Import de document

Les méthode surchargeables appelées lors de l'import d'un document sont :

*   `Doc::preImport`
*   `Doc::postImport`

### Ajout d'un document dans un dossier

Les méthode surchargeables appelées lors de l'ajout d'un document
dans un dossier sont :

*   Lors de l'insertion avec `Dir::addFile`
    *   `Dir::preInsertDoc`
    *   `Dir::postInsertDoc`
*   Lors de l'insertion avec `Dir::insertMDoc`
    *   `Dir::preInsertDoc`
    *   `Dir::postMInsertDoc`

### Retrait d'un document d'un dossier

Les méthode surchargeables appelées lors du retrait d'un document
dans un dossier avec `Dir::delFile` sont :

*   `Dir::preUnlinkDoc`
*   `Dir::postUnlinkDoc`


<!-- links -->
[WP_ORM]: http://en.wikipedia.org/wiki/Object-relational_mapping "Définition du Mapping objet-relationnel sur wikipedia"
[advanced_dbobj]: #core-ref:7a62bb83-17a0-478d-a853-bc359d0fb8fb
[WP_hooks]: http://fr.wikipedia.org/wiki/Hook_%28informatique%29 "Définition des hooks sur wikipedia"