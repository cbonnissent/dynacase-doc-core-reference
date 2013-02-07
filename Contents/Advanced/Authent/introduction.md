# Authentification {#core-ref:b482b82b-ebe2-46e4-8051-c6e83d11a2ae}

## Présentation {#core-ref:269c179c-4dd6-4a57-9559-177b11d6931f}

Le mécanisme d'authentification utilisé par Dynacase est paramétrable et permet
de choisir :

-   l'*Authenticator*
    
    C'est le mode d'interaction avec l'utilisateur pour la saisie des
    information de connexion (formulaire HTML, authentification HTTP Basic,
    etc.) ;

-   le *Provider*
    
    C'est le mode de validation de ces informations de connexion (base
    locale Dynacase, serveur LDAP, fichier texte à plat, etc.).

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

Un *Authenticator* peut utiliser un ou plusieurs *Provider*. Dans ce cas,
ils seront utilisés successivement : si le premier Provider autorise l'accès,
l'utilisateur est connecté ; sinon on passe au Provider suivant, et ainsi de
suite.

Le paramétrage de l'Authenticator, et des Provider à utiliser, s'effectue dans
le fichier `conf/local-dbaccess.php`.

## Workflow d'authentification {#core-ref:7a61108c-45d2-4c62-81dd-e5718380f75b}

![ Workflow d'authentification ](auth_user_method_calls.png)

Lorsque l'utilisateur demande une page, un appel est effectué à la méthode
`checkAuthentication()` *(1)* de l'Authenticator qui retourne si l'utilisateur
est déjà authentifié ou non *(2)*.

Si l'utilisateur est déjà authentifié, alors l'accès à la page est autorisé.

Si l'utilisateur n'est pas authentifié, alors il est redirigé vers la méthode
`askAuthentication()` qui est en charge de dérouter l'exécution vers le code
nécessaire à la demande des informations de connection.

L'utilisateur rentre les informations d'authentification qui sont ensuite
validées auprés des Provider configurés via l'appel de la méthode
`validateCredential()` du Provider *(3)* et *(4)*.

<!-- links -->
[wikipedia_Basic_access_authentication]: http://en.wikipedia.org/wiki/Basic_access_authentication