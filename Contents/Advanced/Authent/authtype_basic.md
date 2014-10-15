# Authentification HTTP Basic {#core-ref:d53b0cf8-8a73-4a72-a8cc-dd60636363f6}

L'Authenticator `basic` ne présente aucune interface pour la saisie du login et
du mot de passe, mais se base sur le mécanisme d'authentification [HTTP
Basic][http_basic].

La sélection du mode d'authentification `basic` s'effectue avec la variable GET
`authtype=basic`, qui permet alors d'indiquer de ne pas utiliser l'Authenticator par défaut (`html` par exemple).

Exemple d'URL avec Authenticator `basic` :

    /index.php?authtype=basic&app=FOO&action=BAR

<!-- links -->
[http_basic]: http://en.wikipedia.org/wiki/Basic_access_authentication