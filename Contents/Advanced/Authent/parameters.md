# Paramétrage Authenticator et Provider {#core-ref:83ef4602-6929-11e2-ad52-0021e9fffec1}

L'Authenticator et les Provider utilisés sont paramétrés dans le fichier
`conf/local-dbaccess.php`.

Le fichier `conf/local-dbaccess.php` permet de surcharger le fichier de
configuration `conf/dbaccess.php` livré par défaut par dynacase.

Exemple de fichier `conf/dbaccess.php` livré par dynacase :

    [php]
    <?php
    
    $pgservice_core = "dynacase";
    $pgservice_freedom = "dynacase";
    $freedom_context = "default";
    $dbpsql = $pgservice_core;
    $useIndexAsGuest = false;
    
    /*
     * Authentication mode : apache / basic / html / open
     * --------------------------------------------------
     */
    
    $freedom_authtype = 'html';
    
    $freedom_authtypeparams = array(
        'html' => array(
            'cookie' => 'freedom_auth',
            'auth' => array(
                'app' => 'AUTHENT',
                'action' => 'LOGINFORM',
                'args' => 'sole=A'
            ) ,
            'username' => 'auth_user',
            'password' => 'auth_pass',
        ) ,
        'open' => array() ,
        'basic' => array(
            'realm' => 'freedom',
        ) ,
    );
    
    /*
     * Providers : how username / password tuple is validated
     * ------------------------------------------------------
     */
    
    $freedom_authprovider = 'freedom';
    
    $freedom_providers = array(
        'freedom' => array(
            'connection' => 'service=' . $pgservice_core,
        ) ,
        'file' => array(
            'authfile' => '@prefix@/.freedompwd',
        ) ,
    );
    
    /*
     * Include local/override config
     * -----------------------------
     */
    $local_dbaccess = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'local-dbaccess.php';
    if (file_exists($local_dbaccess)) {
        include ($local_dbaccess);
    }

Exemple de fichier `conf/local-dbaccess.php` pour la surcharge du paramétrage :

    [php]
    <?php
    
    $freedom_authprovider = 'freedom,freedomNu';
    
    $freedom_providers['freedomNu'] = array(
        'allowAutoFreedomUserCreation' => 'no',
        'fix_euro' => 'no',
        'convert_to_utf8' => 'no',
        'options' => array(
            LDAP_OPT_REFERRALS => 0
        )
    );

Les éléments de configuration utilisables dans ce fichier sont :

`$freedom_authtype`
:   Le mode d'authentification.
    
    Il permet de spécifier quelle interface d'authentification est utilisée
    pour demander les informations de connexion à l'utilisateur (*login* /
    *password* la plupart du temps) et lui transmettre le résultat de
    l'authentification.
    
    Les différents modes disponibles par défaut sont :
    
    `html`
    :   Ce mode fournit une interface HTML pour la saisie des informations de
        connexion (login + mot de passe), et une session par cookie est ouverte
        afin de valider les accès ultérieurs.
        
        C'est l'Authenticator utilisé par défaut.
    
    `apache`
    :   Ce mode spécifie que toute la mécanique d'authentification est
        déléguée à Apache. Dynacase ne s'occupe pas d'authentifier les
        utilisateurs, et Apache lui fournit les utilisateurs qui viennent de
        se connecter via la variable PHP `$_SERVER['PHP_AUTH_USER']`.
        
        Dans ce mode, le paramètre `$freedom_authprovider` n'est pas utilisé.
    
    `basic`
    :   Ce mode fournit une authentification [HTTP
        Basic][wikipedia_Basic_access_authentication].
        
        Dans ce mode, dynacase gère lui même l'authentification au format HTTP
        Basic, et l'utilisateur rentre son login et son mot de passe dans la
        boite de dialogue native affichée par le navigateur.
    
    `open`
    :   Ce mode fournit une interface basée sur la validation de jetons (voir
        détails [Authentification par jetons](#core-ref:9edc8f2e-6929-11e2-8610-0021e9fffec1)
        .
        
        Ce mode ne présente pas d'interface pour la saisie du login et du mot
        de passe, mais se base sur un jeton présent dans l'URI.
        
        Dans ce mode, le paramètre `$freedom_authprovider` n'est pas utilisé.

`$freedom_authprovider`
:   Ce paramètre spécifie le, ou les, Provider à utiliser pour valider les
    logins et mots de passe.
    
    Par défaut, dynacase fournit les Provider suivants :
    
    `freedom`
    :   Ce Provider implémente la validation du login et du mot de passe sur la
        base locale des utilisateurs de dynacase.
        
        C'est le Provider utilisé par défaut.

# Configuration des Authenticators

Chaque Authenticator peut avoir des paramètres pour définir son fonctionnement.

Les paramètres des Authenticator sont spécifiés dans la variable
`$freedom_authtypeparams`.

`html`
:   Les paramètres de l'Authenticator `html` permettent de spécifier :
    
    - l'application et l'action (au sens dynacase) utilisé pour gérer la
    demande des informations de connexion (formulaire HTML) et la
    soumission/validation de ces informations ;
    - le nom du cookie de la session d'authentification ;
    - les noms des champs de saisie du login et du mot de passe du formulaire.
    
    Configuration par défaut :
    
        [php]
        <?php
        
        $freedom_authtypeparams['html'] = array(
            'cookie' => 'freedom_auth',
            'auth' => array(
                'app' => 'AUTHENT',
                'action' => 'LOGINFORM',
                'args' => 'sole=A'
            ) ,
            'username' => 'auth_user',
            'password' => 'auth_pass',
        );

`apache`
:   L'Authenticator `apache` ne possède pas de paramètres.

`basic`
:   Les paramètres de l'Authenticator `basic` permettent de spécifier :
    
    - le REALM de connexion pour l'authentification HTTP Basic.
    
    Configuration par défaut :
    
        [php]
        <?php
        
        $freedom_authtypeparams['basic'] = array(
            'realm' => 'freedom'
        );

`open`
:   L'Authenticator `open` ne possède pas de paramètres.

# Configuration des Providers

Chaque Provider peut avoir des paramètres pour définir son fonctionnement.

`freedom`
:   Les paramètres du Provider `freedom` permettent de spécifier :
    
    - la chaîne de connexion à la base de donnée PostgreSQL.
    
    Configuration par défaut :
    
        [php]
        <?php
        
        $freedom_providers['freedom'] = array(
            'connection' => 'service=' . $pgservice_core
        );

# Pré-sélection du mode d'authentification

Dans certains cas il peut-être utile de pouvoir se connecter sur un même
contexte dynacase via deux mécanismes d'authentification différents
(`$freedom_authtype`).

Par exemple dans le cas d'un contexte dynacase authentifié par CAS, il
peut-être utile de pouvoir se connecter sur ce système sous le compte `admin`
local (Master Default) sans devoir avoir un compte `admin` existant sur CAS.

Pour cela, on peut implémenter un « aiguillage » dans le fichier
`conf/local-dbaccess.php` afin de sélectionner le mode d'authentification en
fonctions d'éléments de la requête (comme le champ `Host:` des requêtes HTTP).

Exemple de fichier `conf/local-dbaccess.php` avec « aiguillage » par
VirtualHost :

    [php]
    <?php
    
    if( $_SERVER['HTTP_HOST'] == 'admin-ged.example.net' ) {
      return;
    }
    
    $freedom_authtype = 'cas';
    
    $freedom_authtypeparams['cas'] = array(
        'cookie' => 'freedom_auth',
        'cas_version' => 'CAS_VERSION_2_0',
        'cas_server' => 'localhost',
        'cas_port' => 8443,
        'cas_uri' => '/cas-server-webapp-3.4'
        );
    
    $freedom_authprovider = 'freedomNu';
    
    $freedom_providers['freedomNu'] = array(
        'allowAutoFreedomUserCreation' => 'yes',
        'fix_euro' => 'no',
        'convert_to_utf8' => 'no'
        );

Dans cet exemple, si on se connecte sur l'URL `http://admin-ged.example.net`,
alors c'est le mécanisme d'authentification définit par défaut dans le
`conf/dbaccess.php` qui sera appliqué, et dans le cas contraire, on appliquera
l'authentification CAS.

De cette manière, les utilisateurs se connectent par CAS sur leur URL
habituelle (`ged.example.net` par ex.), et l'administrateur local peut se
connecter sur l'hôte `admin-ged.example.net`.

