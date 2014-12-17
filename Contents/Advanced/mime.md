# MIME {#core-ref:1e9f18f8-e6f3-451e-9d6c-0ad56205464c}

Lors de l'insertion d'un fichier dans le vault, son type MIME est détecté et
stocké en base de données aux côtés de son identifiant dans le vault (`vid`).

On distingue deux notions sous le terme de type MIME :

* type MIME textuel (e.g. `OpenDocument Text`) : description du type du fichier
dans un format "humain",
* type MIME système (e.g. `application/vnd.oasis.opendocument.text`) : type MIME
du fichier au format "machine" (tel que défini par le registre [IANA][iana_mime]
par exemple).

Ce chapitre détaille les fonctions de détection du type MIME des fichiers.

## Type MIME textuel (`getTextMimeFile()`) {#core-ref:123993b7-4629-45dd-994d-0bf741593490}

Le type MIME textuel est obtenu via l'utilisation de la fonction
`getTextMimeFile()` qui prend les arguments suivants :

(string) `filePath`
:   Le chemin d'accès du fichier dont on souhaite obtenir le type MIME
    textuel (e.g. `/tmp/123DF423/rapport-FZ447BV.doc`).

(string) `fileName` (*optionnel*)
:   Le nom du fichier (e.g. `rapport.doc`).
    
    Par défaut, le nom est vide.

La détection se base en premier sur le nom du fichier (voir
[Paramétrage de la détection par le nom du fichier][mime_user_param] ci-
dessous). Si le type MIME ne peut pas être déduit à partir du nom du fichier,
alors la détection se base sur le contenu du fichier (via la commande système
[`file`][file]).

## Type MIME système (`getSysMimeFile()`) {#core-ref:4b884af2-bb32-40df-8c5d-ffde494bdc9a}

Le type MIME système est obtenu via l'utilisation de la fonction
`getSysMimeFile()` qui prend les arguments suivants :

(string) `filePath`
:   Le chemin d'accès au fichier dont on souhaite obtenir le type MIME
    textuel (e.g. `/tmp/123DF423/rapport-FZ447BV.doc`).

(string) `fileName` (*optionnel*)
:   Le nom du fichier (e.g. `rapport.doc`).
    
    Par défaut, le nom est vide.

La détection se base en premier sur le nom du fichier (voir
[Paramétrage de la détection par le nom du fichier][mime_user_param] ci-
dessous). Si le type MIME ne peut pas être déduit à partir du nom du fichier,
alors la détection se base sur le contenu du fichier (via la commande système
[`file`][file]).

## Paramétrage de la détection par le nom du fichier {#core-ref:9daa8254-956e-43eb-88f0-f9c35b505b86}

La détection du [type MIME textuel][mime_t] et du [type MIME système][mime_s]
est paramétrable via des règles appliquées sur l'extension du nom du fichier.

Ces règles sont décrites au format XML dans le fichier `config/user-mime.conf`.

Un fichier d'exemple est fournit par défaut dans `config/user-mime.conf.sample`.

Exemple de définition des types MIME textuel et système pour les fichiers
d'extension `.foo` et `.bar` :

    [xml]
    <?xml version="1.0" encoding="utf-8"?>
    <mimes>
      <mime ext="foo" sys="application/foo" text="Foo file" />
      <mime ext="bar" sys="application/bar" text="Bar file" />
    </mimes>

Chaque règle est décrite à l'aide d'un élément `<mime/>` comportant l'extension
(sans le point de l'extension) sur laquelle elle s'applique (attribut `ext`) et
le type MIME textuel et système correspond qui est retourné (attribut `text` et
`sys`).

Les règles sont évaluées dans l'ordre d'écriture dans le fichier XML. La détection s'arrête à la première règle qui
correspond à l'extension du fichier.

Les règles du fichier `config/user-mime.conf` sont évaluées en
priorités par rapport au jeu de règles fournit par défaut par Dynacase
(consultable dans le fichier `config/mime.conf`).

<!-- links -->
[iana_mime]: http://www.iana.org/assignments/media-types/media-types.xhtml
[mime_t]: #core-ref:123993b7-4629-45dd-994d-0bf741593490
[mime_s]: #core-ref:4b884af2-bb32-40df-8c5d-ffde494bdc9a
[mime_user_param]: #core-ref:9daa8254-956e-43eb-88f0-f9c35b505b86
[file]: http://manpages.ubuntu.com/manpages/trusty/en/man1/file.1.html