# Documents confidentiels {#core-ref:ba033340-2117-46f4-9efc-19c8609a8f28}

Un document *confidentiel* est un document dont l'affichage est soumis à un
droit spécifique : le droit `confidential`.

La [propriété][docprop] `confidential` indique la caractère confidentiel d'un
document. S'il est supérieur à zéro, le document est considéré comme
confidentiel.

Les interfaces d'affichage standards de document comme [`FDL:OPENDOC`][opendoc]
prennent en compte cette propriété afin d'indiquer que le document est
confidentiel et ne montre pas son contenu.

Les interfaces standards d'affichage de liste de document comme
`GENERIC:GENERIC_LIST` n'affichent pas les documents confidentiels.

Pour afficher un document confidentiel, il faut que l'utilisateur dispose du
droit `view` **et** du droit `confidential`.

**Attention** : La classe `SearchDoc` de recherche de document retourne par
défaut les documents confidentiels. Il faut explicitement utiliser la méthode
[`DocSearch::excludeConfidential()`][searchdocexclude] pour les filtrer. Dans le
cas contraire, le développeur a en charge de montrer que les parties voulues
sur l'interface cliente.


<!-- links -->

[docprop]:          #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353
[aclconfidential]:  #core-ref:a99dcc5f-f42f-4574-bbfa-d7bb0573c95d
[opendoc]:          #core-ref:f9e68fa7-01b7-4903-9718-744271d63112
[searchdoc]:        #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255
[searchdocexclude]: #core-ref:17be152c-0844-40d5-bfc5-a9aa2f2695fc