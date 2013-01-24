# Authentification par jetons {#core-ref:9edc8f2e-6929-11e2-8610-0021e9fffec1}

L'Authenticator `open` ne présente aucune interface pour la saisie du login et
du mot de passe, mais se base sur un jeton présent dans l'URL.

Dans ce mode d'authentification, le paramètre `$freedom_authprovider` n'est pas
utilisé.

Le jeton est contenu dans la variable GET `privateid`.

La sélection du mode d'authentification `open` s'effectue avec la variable GET
`authtype=open`, qui permet alors d'indiquer de ne pas utiliser l'Authenticator
par défaut (`html` par exemple).

Exemple d'URL avec Authenticator `open` et jeton :

    /index.php?authtype=open&privateid=e2bb65612c70e7ac78d5ccbfe12aa234&app=FOO&action=BAR

L'action demandée par la requête doit être déclarée `openaccess=Y` pour pouvoir
être utilisable avec l'authentification par jetons.

Les jetons sont créés à l'aide de la classe `Class.UserToken.php`.

Un jeton peut être paramétré pour n'être utilisable qu'avec une action bien
définie, et empêcher ainsi qu'il ne soit utilisé pour éexécuter une action non
autorisée.

Pour plus de détails sur la création des jetons : voir la documentation du
fichier de la classe `Class.UserToken.php`.
