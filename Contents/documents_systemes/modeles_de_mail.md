# Modèle de mail {#core-ref:8723b1aa-10d3-4316-af6b-071f4d59ceee}

Les modèles de mail permettent de paramétrer les mails qui seront envoyés par
Dynacase. Un modèle de mail permet de définir :

*   l'expéditeur,
*   le(s) destinataire(s),
*   le sujet du mail,
*   le corps du mail,
*   les pièces jointes

Chacune de ces parties pourra être dynamique en fonction des valeurs du document
auquel le mail envoyé est rattaché.

Le modèle de mail porte les informations suivantes :

**Titre** (Obligatoire)
:   Titre sous lequel sera enregistré le modèle de mail. Cette valeur ne sert
    que dans Dynacase, et ne sera pas exposée à l'utilisateur final (sauf dans
    l'historique système).

Famille
:   Famille à laquelle est rattaché le modèle de mail. Cette famille permet de
    lister les attributs qui seront utilisables pour la composition du mail.
    
    **Note** : Dans l'éditeur du corps de message, les clefs d'attributs ne sont
    accessibles que lors d'une modification du document après avoir sélectionné
    la famille et non directement lors de l'ouverture du formulaire d'édition du
    modèle de mail.

Famille cycle
:   Famille du cycle de vie auquel est rattaché ce modèle de mail. Cette famille
    permet de lister les attributs qui seront utilisables pour la composition du
    mail.

L'émetteur
:   Il peut être choisi au moyen de [règles avancées][emetteur_destinataire] à
    partir des valeurs du document.

Les destinataires
:   Ils peuvent être choisis au moyen de
    [règles avancées][emetteur_destinataire] à partir des valeurs du document.

Le sujet
:   Le sujet est un texte libre. Il peut contenir des parties variables issues
    du document qui va être envoyé, sous la forme `[BALISE]`.
    Les balises sont générées par le document, et peuvent être complétées par le
    second paramètre de la méthode `MailTemplate::sendMail()`.
    
    **Note**: attention, le sujet d'un mail ne devant pas contenir de html, il
    est déconseillé d'utiliser les balises `[V_TITLE]` ou `[V_ATTRID]`.

Le corps
:   Le corps est un texte html avec mise en forme. Il peut contenir des parties
    variables issues du document qui va être envoyé, sous la forme `[BALISE]`.
    Les balises sont générées par le document, et peuvent être complétées par le
    second paramètre de la méthode `MailTemplate::sendMail()`.

Les pièces jointes
:   Les fichiers attachés font référence à des attributs de type *file* (ou
    *image*) du document. Les fichiers seront alors en pièce jointe du courriel.
    Bien sûr, ces attributs peuvent être des listes de fichiers (attribut
    *file* ou *image* dans un tableau).
    
     Il est possible d'utiliser la notation `:` pour aller chercher des
    valeurs sur les documents liés (par exemple : `TST_MYID:THE_FILE`
    récupère la valeur de l'attribut `THE_FILE` dans le document référencé par
    l'attribut relation `TST_MYID`). La notation `:` peut être utilisée
    plusieurs fois pour aller de relation en relation (par exemple :
    `TST_RELATIONONEID:OTHER_RELATIONID:THE_FILE`).

## Spécification de l'émetteur ou du destinataire {#core-ref:c73aee80-78d9-460e-ad7e-de13bfb849cd}

L'émetteur ou les destinataires peuvent être choisis parmi :

### Adresse fixe {#core-ref:c214dc69-9311-402f-a0e3-59b8217dbe7f}

Le destinataire est alors *statique*. Une aide à la saisie permet de récupérer
l'adresse d'un utilisateur existant, mais une fois la valeur saisie, elle ne
sera jamais mise à jour.
    
L'adresse indiquée doit être dans une forme acceptable pour le champ *from*
d'une requête SMTP (ie. de la forme `"nom expéditeur" <mail@host.net`.

### Valeur du document lié {#core-ref:2763d270-ddf1-4ebf-8b6b-b78e816d442f}

#### Attribut texte {#core-ref:5a8c0e1c-fb19-41b8-bfd9-f3e08ce3d286}

Le destinataire est alors dynamique, et est rattaché à un attribut textuel du
document. Cet attribut doit contenir une adresse email dans une forme
acceptable pour le champ *from* d'une requête SMTP (ie. de la forme 
`"nom expéditeur" <mail@host.net`).

Il est possible d'utiliser la notation `:` pour aller chercher des valeurs sur
les documents liés (par exemple : `TST_MYID:THE_MAIL` récupère la valeur de
l'attribut `THE_MAIL` dans le document référencé par l'attribut relation
`TST_MYID`.)
        
La notation `:` peut être utilisée plusieurs fois pour aller de relation en
relation (par exemple : `TST_RELATIONONEID:OTHER_RELATIONID:THE_MAIL`).

#### Attribut relation {#core-ref:0d300c86-27c5-4f71-8ddc-12c0717d7ef4}

Le destinataire est alors dynamique, et est rattaché à un attribut de type
relation (*account* ou *docid*) du document.
        
Si le document cible implémente une méthode `::getMail()`, alors elle sera
utilisée pour renseigner l'émetteur. Sinon, il sera récupéré à partir de
l'attribut `US_MAIL` du document cible.
        
**Note** : Pour l'émetteur, les adresses de groupes ne peuvent être utilisés
(il est en effet interdit de spécifier un émetteur multiple au niveau de la
norme SMTP.

### Paramètre de famille texte {#core-ref:2e48132b-0bc2-468b-a610-077b0c58955f}

Le destinataire est alors dynamique, et est rattaché à un paramètre de la
famille du document.  Ce paramètre doit contenir une adresse email dans une
forme acceptable pour le champ*from* d'une requête SMTP (ie. de la forme 
`"nom expéditeur" <mail@host.net`).
        
**Note** : La notation `:` n'est pas autorisée pour les paramètres.

### Paramètre de famille relation {#core-ref:36c48d6a-4a8a-4ef9-b1e4-863f90a14320}

Le destinataire est alors dynamique, et est rattaché à un paramètre de famille
de type relation (*account* ou *docid*).
        
Si le document cible implémente une méthode `::getMail()`, alors elle sera
utilisée pour renseigner l'émetteur. Sinon, il sera récupéré à partir de
l'attribut `US_MAIL` du document cible.
        
**Note** : Pour l'émetteur, les adresses de groupes ne peuvent être utilisés
(il est en effet interdit de spécifier un émetteur multiple au niveau de la
norme SMTP.

### Valeur du workflow lié {#core-ref:1701dddf-665a-4ce4-9bb0-b6f0742bb105}

#### Attribut cycle {#core-ref:fcfdf8bb-718b-47b4-9067-b6ea36820ef7}
    
Il se comporte comme un *[attribut texte][attribut_texte]*, mais est récupéré
sur le workflow associé au document.

#### Relation cycle {#core-ref:05ee7ed1-c7c2-4d98-a26f-ce600faf562b}
    
Il se comporte comme un *[attribut relation][attribut_relation]*, mais est
récupéré sur le workflow associé au document.

#### Paramètre cycle {#core-ref:8370014c-5d2a-4c8e-b725-59022a906e99}

Il se comporte comme un *[paramètre de famille texte][parametre_famille_texte]*,
mais est récupéré sur la famille du workflow associé au document.

### Document destinataire {#core-ref:e717367f-7a29-473d-a65a-ac2c924bd0cb}

<span class="flag from release">3.2.19</span> Le destinataire est obtenu 
*dynamiquement*, lors de l'envoi du mail, à partir d'un document qui implémente
l'interface *[IMailRecipient][phpdoc_IMailRecipient]*.
    
Les documents sélectionnables dans ce champ sont tous les documents dont la
classe implémente l'interface [`IMailRecipient`][phpdoc_IMailRecipient].
    
Le destinataire est obtenu de manière dynamique lors de l'envoi du mail par
l'appel à la méthode `::getMail()` de ce document.

## Sujet et corps du mail {#core-ref:e0fb55dc-dd11-4e95-8e24-18e92fb8fc8c}

Le sujet et le corps du mail sont considérés comme des layouts et les balises [applicables][TemplateBaliseText] sont utilisables à l'exception de la balise `BLOCK` car il n'est pas possible de faire un setBlockData sur un modèle de mail.

De plus, le [contrôleur par défaut][ControleurDefaut] est appelé avant le rendu du template donc toutes les clefs de ce contrôleur sont disponibles dans le sujet et le corps du mail.

<span class="flag inline nota-bene"></span> La balise `[TITLE]` est notamment disponible, elle permet d'intégrer la version textuelle du titre du document associé au template.

## Hyperliens {#core-ref:0d251885-b91f-4ceb-bf8c-97b4954040af}

### Calcul des liens {#core-ref:1f7269a5-fedf-40b1-bc92-2d1566e3de7d}

Les liens sont générés au moyen de la
[méthode `Doc::getDocAnchor`][getDocAnchor].

Les URLS dans les modèles de mail sont composées à partir de la valeur du
paramètre `CORE_MAILACTIONURL`, lui-même composé à partir
du [paramètre `CORE_MAILACTION`][CORE_MAILACTION].

### Désactivation des liens {#core-ref:976387b2-fdc0-4697-96f9-583f2181b375}

Lorsque le mail est envoyé à des personnes qui n'ont pas de compte sur le
système d'information, il est inutile de leur envoyer des liens vers des
ressources auxquelles ils n'ont pas accès. Il est donc possible de désactiver
tous les liens vers les documents, au moyen de l'attribut *avec liens*, qui doit
alors être décoché.

## Enregistrement des messages envoyés {#core-ref:cfd63c8d-05b6-4c29-9517-c90ca6076eae}

Les messages envoyés peuvent être enregistrés. Dans ce cas, le message est
stocké dans la famille *message envoyé*, et son profil est identique à celui du
document servant à l'envoi.

Pour stocker le message il faut cocher l'attribut *Enregistrer une copie*.

**Note** : Attention, cela peut générer un grand nombre de documents, ce qui
peut conduire à terme à une dégradation des performances.

## Historique {#core-ref:940b9b75-5567-45ee-afa0-33ae9d56d77a}

Pour chaque message envoyé, un message est ajouté à  l'historique du document
servant à l'envoi. Ce message contient :

* le titre du modèle de mail
* le sujet du message
* les destinataires.

Si une erreur survient lors de l'envoi du message, elle est ajoutée à
l'historique du document servant à l'envoi, et est retournée à l'utilisateur.

## Limitations {#core-ref:568e0c31-6115-4d80-8ffb-dac4cda93df2}

Les messages ainsi générés ne sont pas des listes de diffusion : un seul mail
est envoyé. Aussi, lors de l'envoi d'un message à plusieurs destinataires, tous
recevront le même message, et il n'est pas possible de personnaliser le message
par utilisateur.

Le sujet et le corps du mail ne peuvent pas faire appel à l'instruction `BLOCK`.

<!-- links -->
[emetteur_destinataire]: #core-ref:c73aee80-78d9-460e-ad7e-de13bfb849cd
[getDocAnchor]: #core-ref:55e9c46c-2a10-4911-8243-7c913416648f
[CORE_MAILACTION]: #core-ref:c1d9e009-49a5-47a4-9104-4d044ea24aa3
[TemplateBaliseText]: #core-ref:32dea245-37e6-4a4c-a65e-06c577c0effa
[ControleurDefaut]: #core-ref:1b7cb4c6-df1e-4124-8f5d-deaeac92561b
[phpdoc_IMailRecipient]: https://docs.anakeen.com/dynacase/3.2/dynacase-core-api-reference/interface_i_mail_recipient.html
[attribut_texte]: #core-ref:5a8c0e1c-fb19-41b8-bfd9-f3e08ce3d286
[attribut_relation]: #core-ref:0d300c86-27c5-4f71-8ddc-12c0717d7ef4
[parametre_famille_texte]: #core-ref:2e48132b-0bc2-468b-a610-077b0c58955f
