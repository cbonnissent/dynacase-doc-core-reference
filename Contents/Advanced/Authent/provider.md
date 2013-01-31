# Créer son propre Provider {#core-ref:5a149c1c-c262-4aa6-b7b8-b66135140c49}

Un Provider doit hériter de, et implémenter les méthodes définies dans, la
classe `WHAT/Class.Provider.php`.

Les méthodes à implémenter obligatoirement sont :

* abstract function validateCredential($username, $password)
* abstract function validateAuthorization($opt)

Les méthodes optionnelles sont :

* public function __construct($authProviderName, $parms)
* public function initializeUser($username)

## Méthodes {#core-ref:deda6439-73a2-41b5-8ba6-43b40683576d}

### validateCredential() {#core-ref:8c6a4a9d-f115-4293-9b30-71b5db601e38}

Cette méthode prend en entrée deux arguments qui sont :

* `$username` : le login entré par l'utilisateur ;
* `$password` : le mot de passe entré par l'utilisateur.

La méthode doit retourner :

* `true` si le couple login/mot de passe est correct ;
* `false` si le couple login/mot de passe est incorrect.

### validateAuthorization() {#core-ref:dbdedeed-dfd4-491f-89d2-a6b778127822}

Une fois le couple login/password validé, cette méthode permet de contrôler si
l'utilisateur est autorisé à se connecter.

Cette méthode prend entrée un argument :

*   `$opt`: une structure contenant le nom de l'utilisateur.
    
        [php]
        $opt = array(
            'username' => $username
        );

La méthode retourne :

* `true` si l'utilisateur est autorisé à se connecter ;
* `false` dans le cas contraire.

### __construct() {#core-ref:6ff38a1e-3233-49b5-8a89-1dce26fb2006}

C'est le constructeur du Provider que l'on peut étendre si celui-ci nécessite
une initialisation particulière.

Cette méthode prend en entrée deux arguments qui sont :

* `$authProviderName` : le nom du provider ;
* `$parms` : un array contenant les paramètres du provider.

### initializeUser() {#core-ref:a081aef3-d74f-4c4f-a704-c055f1b15275}

Si le compte de l'utilisateur n'existe pas dans dynacase, cette méthode est
utilisée pour créer le compte de l'utilisateur dans dynacase.

Cette méthode prend en entrée le login de l'utilisateur :

* `$username` : le login de l'utilisateur.

La méthode retourne :

* `""` : une chaîne vide s'il n'y a pas eu d'erreur à la création du compte.
* `"Error message …"` : une chaîne non vide contenant le message d'erreur
rencontré.

Cette méthode spécifique implémente la recherche des informations de
l'utilisateur à partir du login sur le système d'authentification utilisé, et la
création du compte utilisateur dynacase avec les informations obtenus.

## Exemple {#core-ref:426732fd-ee24-4eb0-a81c-4b3ff566da5e}

Dans l'exemple ci-dessous, nous allons écrire un Provider pour valider les mots
de passe des utilisateurs auprès d'un service [PAM][Wikipedia_PAM] à l'aide de 
la commande [`checkpassword-pam`][MAN_checkpassword-pam]
Ce module ne supportera pas la création d'utilisateurs à la volée.

### Fichier `config/local-dbaccess.php` {#core-ref:2e557c8b-0a03-4bf8-a576-79181a764d57}

On va déclarer dans le fichier `config/local-dbaccess.php` que l'on utilise en
premier notre Provider `pam`, et ensuite le Provider `freedom` si l'utilisateur
n'est pas reconnu par le Provider `pam`.

Notre Provider `pam` aura un paramètre nommé `service` qui contiendra le nom du
service PAM auprès duquel seront validés les logins et mots de passe (c'est le
nom du fichier situé dans `/etc/pam.d`).

    [php]
    <?php
    
    $freedom_authprovider = 'pam,freedom';
    
    $freedom_providers['pam'] = array(
        'service' => 'dynacasepam'
    );

### Fichier `WHAT/providers/Class.pamProvider.php` {#core-ref:bd260a20-d0be-4faa-928b-57abad5b288a}

Notre Provider est donc décrit dans le fichier `Class.pamProvider.php` situé
dans le sous-répertoire `WHAT/providers` de l'installation dynacase.

Celui-ci fournit une classe `pamProvider` qui étend la classe `Provider`, et
nous allons décrire nos méthodes spécifiques `validateCredential()` et
`validateAuthorization()`.

Dans `validateCredential()` nous allons récupérer le paramètre `service` de
notre provider, et utiliser la commande `checkpassword-pam` pour valider le
username et le password reçu.

Pour simplifier l'exemple, la méthode `validateAuthorization()` retournera
`true` systématiquement (on supposera que l'autorisation du compte est établie
dans la phase de validation du mot de passe).

    [php]
    <?php
    
    include_once('WHAT/Class.Provider.php');
    
    Class pamProvider extends Provider {
    
        public function validateCredential($username, $password) {
            $service = 'freedom';
            if( array_key_exists('service', $this->parms) ) {
                $service = $this->parms{'service'};
            }
            return $this->checkpassword_pam($username, $password, $service);
        }
        
        public function validateAuthorization($opt) {
            $username = $opt{'username'};
            return true;
        }
        
        public function checkpassword_pam($username, $password, $service) {
            $cmd = sprintf("checkpassword-pam --service %s --no-chdir-home --noenv", escapeshellarg($service));
            $proc = proc_open($cmd, array(3=>array('pipe', 'r')), $pipes);
            if( ! is_resource($proc) ) {
                error_log(__CLASS__."::".__FUNCTION__." ".sprintf("Error running checkpassword-pam"));
                return false;
            }
            fwrite($pipes[3], sprintf("%s\0%s\0timestamp\0",
                $username,
                $password
            ));
            fclose($pipes[3]);
            $ret = proc_close($proc);
            if( $ret === 0 ) {
                return true;
            }
            error_log(__CLASS__."::".__FUNCTION__." ".
                sprintf("Authentication failed for user '%s' and service '%s'.",
                    $username,
                    $service
                )
            );
            return false;
        }
    }

### Fichier `/etc/pam.d/dynacase` {#core-ref:c2251b52-e20c-49bf-9876-f617fc533800}

Pour finir, le fichier associé au paramètre `service` de notre Provider. Celui-
ci contiendra les règles que l'on souhaite voir appliqué pour la validation des
comptes. Dans cet exemple, on utilisera une authentification des comptes sur la
base locale des utilisateurs Unix du serveur.

    auth       sufficient     pam_unix.so
    auth       required       pam_deny.so
    account    required       pam_permit.so
    session    required       pam_permit.so

<!-- links -->
[Wikipedia_PAM]: http://en.wikipedia.org/wiki/Linux_PAM "Descrition de Linux PAM sur Wikipedia"
[MAN_checkpassword-pam]: http://checkpasswd-pam.sourceforge.net/checkpassword-pam.8.html "MAN page de checkpassword-pam"