# Manipulation par le code des documents liés à un workflow {#core-ref:eea75124-15ea-477f-88f4-94f2ca57646b}

Lorsqu'un document est lié à un workflow, sa propriété `wid` porte l'identifiant
du *document de workflow* concerné.

Il est possible de :

*   demander un changement d'état au moyen de la méthode
    [`Doc::setState`][doc_setState] ;
*   récupérer l'état du document au moyen de la méthode
    [`Doc::getState`][doc_getState] ;

<!--links -->
[doc_setState]: #core-ref:c4b38315-9847-45c0-9e1d-b2ac92d4efc0
[doc_getState]: #core-ref:09cc14aa-8400-4dd2-a52e-644bb1e30477