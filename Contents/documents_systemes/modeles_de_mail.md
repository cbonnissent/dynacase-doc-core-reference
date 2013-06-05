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
    
    **Note**: attention, le sujet d'un mail ne pouvant pas contenir de html, il
    est déconseillé d'utiliser les balises `[V_TITLE]` ou `[V_ATTRID]` où attrid
    est une relation.

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

*   une *adresse fixe* : le destinataire est alors *statique*. Une aide à la
    saisie permet de récupérer l'adresse d'un utilisateur existant, mais une
    fois la valeur saisie, elle ne sera jamais mise à jour.
    
    L'adresse indiquée doit être dans une forme acceptable pour le champ
    *from* d'une requête SMTP (ie. de la forme
    `"nom expéditeur" <mail@host.net`.

*   Une valeur du document lié :
    
    *   un *attribut texte* : le destinataire est alors dynamique, et est
        rattaché à un attribut textuel du document. Cet attribut doit
        contenir une adresse email dans une forme acceptable pour le champ
        *from* d'une requête SMTP (ie. de la forme
        `"nom expéditeur" <mail@host.net`).
        
        Il est possible d'utiliser la notation `:` pour aller chercher des
        valeurs sur les documents liés (par exemple : `TST_MYID:THE_MAIL`
        récupère la valeur de l'attribut `THE_MAIL` dans le document référencé
        par l'attribut relation `TST_MYID`.)
        
        La notation `:` peut être utilisée plusieurs fois pour aller de relation
        en relation (par exemple :
        `TST_RELATIONONEID:OTHER_RELATIONID:THE_MAIL`).
    
    *   un *attribut relation* : le destinataire est alors dynamique, et est
        rattaché à un attribut de type relation (*account* ou *docid*) du
        document.
        
        Si le document cible implémente une méthode `::getMail()`, alors elle
        sera utilisée pour renseigner l'émetteur. Sinon, il sera récupéré à
        partir de l'attribut `US_MAIL` du document cible.
        
        **Note** : Pour l'émetteur, les adresses de groupes ne peuvent être
        utilisés (il est en effet interdit de spécifier un émetteur multiple
        au niveau de la norme SMTP.
    
    *   un *paramètre de famille texte* : le destinataire est alors
        dynamique, et est rattaché à un paramètre de la famille du document.
        Ce paramètre doit contenir une adresse email dans une forme
        acceptable pour le champ*from* d'une requête SMTP (ie. de la forme
        `"nom expéditeur" <mail@host.net`).
        
        **Note** : La notation `:` n'est pas autorisée pour les paramètres.
    
    *   un *paramètre de famille relation* : le destinataire est alors
        dynamique, et est rattaché à un paramètre de famille de type
        relation (*account* ou *docid*).
        
        Si le document cible implémente une méthode `::getMail()`, alors elle
        sera utilisée pour renseigner l'émetteur. Sinon, il sera récupéré à
        partir de l'attribut `US_MAIL` du document cible.
        
        **Note** : Pour l'émetteur, les adresses de groupes ne peuvent être
        utilisés (il est en effet interdit de spécifier un émetteur multiple
        au niveau de la norme SMTP.

*   Une valeur du workflow lié :
    
    *   un *attribut cycle* : Il se comporte comme un *attribut texte*, mais
        est récupéré sur le workflow associé au document.
    
    *   une *relation cycle* : Il se comporte comme un *attribut relation*,
        mais est récupéré sur le workflow associé au document.
    
    *   un *paramètre cycle* : Il se comporte comme un *paramètre de famille
        texte*, mais est récupéré sur la famille du workflow associé au
        document.

## Hyperliens {#core-ref:0d251885-b91f-4ceb-bf8c-97b4954040af}

### Calcul des liens {#core-ref:1f7269a5-fedf-40b1-bc92-2d1566e3de7d}

Les liens sont générés au moyen de la
[méthode `Doc::getDocAnchor`][getDocAnchor].

Les URLS dans les modèles de mail sont composées à partir de la valeur du
[paramètre `CORE_MAILACTIONURL`][CORE_MAILACTIONURL], lui-même composé à partir
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
*   le titre du modèle de mail
*   le sujet du message
*   les destinataires.

Si une erreur survient lors de l'envoi du message, elle est ajoutée à
l'historique du document servant à l'envoi, et est retournée à l'utilisateur.

## Limitations {#core-ref:568e0c31-6115-4d80-8ffb-dac4cda93df2}

Les messages ainsi générés ne sont pas des listes de diffusion : un seul mail
est envoyé. Aussi, lors de l'envoi d'un message à plusieurs destinataires, tous
recevront le même message, et il n'est pas possible de personnaliser le message
par utilisateur.


<!-- links -->
[emetteur_destinataire]: #core-ref:c73aee80-78d9-460e-ad7e-de13bfb849cd
[getDocAnchor]: #core-ref:55e9c46c-2a10-4911-8243-7c913416648f
[CORE_MAILACTION]: #core-ref:c1d9e009-49a5-47a4-9104-4d044ea24aa3
[CORE_MAILACTIONURL]: #core-ref:033299c3-fe9a-4833-9dbd-45952bdf63bc