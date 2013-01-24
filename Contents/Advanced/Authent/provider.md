# Créer son propre Provider

Un Provider doit hériter de, et implémenter les méthodes définies dans, la
classe `WHAT/Class.Provider.php`.

Les méthodes à implémenter obligatoirement sont :

* abstract function validateCredential($username, $password)
* abstract function validateAuthorization($opt)

Les méthodes optionnelles sont :

* public function __construct($authprovider, $parms)
* public function initializeUser($username)

## Méthodes

### validateCredential()

Cette méthode prend en entrée deux arguments qui sont :

* `$username` : le login entré par l'utilisateur ;
* `$password` : le mot de passe entré par l'utilisateur.

La méthode doit retourner :

* `true` si le couple login/mot de passe est correct ;
* `false` si le couple login/mot de passe est incorrect.

### validateAuthorization()

Une fois le couple login/password validé, cette méthode permet de contrôler si
l'utilisateur est autorisé à se connecter.

Cette méthode prend entrée un argument :

* `$opt`: une structure contenant le nom de l'utilisateur.

    [php]
    $opt = array(
        'username' => $username
    );

La méthode retourne :

* `true` si l'utilisateur est autorisé à se connecter ;
* `false` dans le cas contraire.

### __construct()

C'est le constructeur du Provider que l'on peut étendre si celui-ci nécessite
une initialisation particulière.

Cette méthode prend en entrée deux arguments qui sont :

* `$authprovider` :
* `$parms` :

### initializeUser()

Si le compte de l'utilisateur n'existe pas dans dynacase, cette méthode est
utilisée pour créer le compte de l'utilisateur dans dynacase.

Cette méthode prend en entrée le login de l'utilisateur :

* `$username` : le login de l'utilisateur.

La méthode retourne :

* `””` : une chaîne vide s'il n'y a pas eu d'erreur à la création du compte.
* `“Error message …”` : une chaîne non vide contenant le message d'erreur
rencontré.

Cette méthode spécifique implémente la recherche des informations de
l'utilisateur à partir du login sur le système d'authentification utilisé, et la
création du compte utilisateur dynacase avec les informations obtenus.

## Exemple

Dans l'exemple ci-dessous, nous allons écrire un Provider pour valider les mots
de passe des utilisateurs auprès d'un service PAM à l'aide de la commande
`checkpassword-pam`. Ce module ne supportera pas la création d'utilisateurs à la
volée.

### Fichier `config/local-dbaccess.php`

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

### Fichier `WHAT/providers/Class.pamProvider.php`

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

### Fichier `/etc/pam.d/dynacase`

Pour finir, le fichier associé au paramètre `service` de notre Provider. Celui-
ci contiendra les règles que l'on souhaite voir appliqué pour la validation des
comptes. Dans cet exemple, on utilisera une authentification des comptes sur la
base locale des utilisateurs Unix du serveur.

    auth       sufficient     pam_unix.so
    auth       required       pam_deny.so
    account    required       pam_permit.so
    session    required       pam_permit.so
