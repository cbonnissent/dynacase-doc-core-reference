# Authentification {#core-ref:b482b82b-ebe2-46e4-8051-c6e83d11a2ae}

Le mécanisme d'authentification utilisé par Dynacase est paramétrable et permet
de choisir :

- le mode d'interaction (Authenticator) avec l'utilisateur pour la saisie des
  information de connexion (formulaire HTML, authentification HTTP Basic, etc.)
 ;
- le mode de validation (Provider) de ces informations de connexion (base
  locale Dynacase, serveur LDAP, fichier texte à plat, etc.)

Dynacase fournit par défaut les Authenticators et Providers suivants :

*   Authenticator
    
    `html`
    :   formulaire HTML (`Class.htmlAuthenticator.php`) ;
    
    `basic`
    :   authentification [HTTP Basic][wikipedia_Basic_access_authentication]
        (`Class.basicAuthenticator.php`) ;
    
    `open`
    :   authentification par jeton (`Class.openAuthenticator.php`) ;

*   Provider
    
    `freedom`
    :   authentification sur la base locale Dyancase
        (`Class.freedomProvider.php`).

Un Authenticator peut utiliser un ou plusieurs backend Provider, dans ce cas,
ils seront utilisés successivement : si le premier Provider autorise l'accès,
l'utilisateur est connecté ; sinon on passe au Provider suivant, et ainsi de
suite.

Le paramétrage de l'Authenticator, et des Provider à utiliser, s'effectue dans
le fichier `conf/local-dbaccess.php`.

![ Workflow d'authentification ](auth_user_method_calls.png)

Lorsque l'utilisateur demande une page, un appel est effectué à la méthode
`checkAuthentication()` de l'Authenticator qui retourne si l'utilisateur est
déjà authentifié ou non.

Si l'utilisateur est déjà authentifié, alors l'accès à la page est autorisé.

Si l'utilisateur n'est pas authentifié, alors il est redirigé vers la méthode
`askAuthentication()` qui est en charge de dérouter l'exécution vers le code
nécessaire à la demande des informations de connection.

L'utilisateur rentre les informations d'authentification qui sont ensuite
validées auprés des Provider configurés via l'appel de la méthode
`validateCredential()` du Provider.



[wikipedia_Basic_access_authentication]: http://en.wikipedia.org/wiki/Basic_access_authentication