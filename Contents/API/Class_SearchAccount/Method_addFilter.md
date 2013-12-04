# SearchAccount::addFilter() {#core-ref:e785ea85-d398-4b6f-8a14-0224f0a9e69f}

<div markdown="1" class="short-description">
Cette méthode permet d'ajouter des filtres sur les caractéristiques des comptes.
</div>


## Description {#core-ref:52316de9-6382-49ce-9ac5-e13a6f70f1f7}

    [php]
    void addFilter( string             $filter, 
                    [string|int|double $args…])

La recherche effectuée avec la classe `SearchAccount` porte sur la 
[base dbaccount][dataAccount]. Les filtres ajoutés doivent donc porter sur une
ou plusieurs des colonnes de cette base, soit :

* login,
* firstname,
* lastname,
* mail.

### Avertissements {#core-ref:f8c779a3-3864-41d7-a6d1-65832c017401}

Aucun

## Liste des paramètres {#core-ref:f0e8599d-43d3-47fc-8d08-22b446efe01f}

(string) `filter`
:   Partie filtre de la recherche, cette partie doit être soit une chaîne de 
    caractères contenant du SQL, soit une [chaîne formatée][phpSprintf] celle-ci
    est alors complétée avec les valeurs passées dans les arguments suivants.
    **Attention** : Le points suivant est à prendre en compte :
    
    *   [injections SQL][wikipediaInjectionSQL] : le premier argument de la méthode
        addFilter est ajouté tel quel dans la requête SQL, il est donc possible qu'il 
        puisse déclencher une injection SQL. Les données doivent être 
        échappées (par exemple à l'aide de [pg_escape_string][pgEscape]),

(string|int|double) `value`
:   Valeurs qui sont concaténées à la partie filter à l'aide la fonction 
    [`sprintf`][phpSprintf].  
    **Note** : Cet argument peut-être répété autant de fois
    que souhaité.  
    **Attention** : Les paramètres passés par value sont échappés à l'aide de la
    fonction [pg_escape_string][pgEscape].  
    **Attention** : Dans le cas de l'utilisation d'un opérateur à base d'expression
    régulière, il faut utiliser la fonction [preg_quote][preg_quote] sans quoi 
    les valeurs peuvent rendre l'expression régulière invalide.


## Valeur de retour {#core-ref:07faac41-3ce3-488b-92f8-6ad11b61c1fa}

void

## Erreurs / Exceptions {#core-ref:9947372c-d769-43cb-a5e4-bc8aea0c55d5}

Aucunes

## Historique {#core-ref:0d74a089-3859-4001-9bcf-3f229639b557}

Aucun

## Exemples {#core-ref:1a31a904-7d91-4f0d-a406-2b3f55bc3f5e}

Recherche sur les mails contenant `george` :

    [php]
    function searchGeorge(Action & $action)
    {
        header('Content-Type: text/plain');
        
        $mailExpr='george';
        $searchAccount = new SearchAccount();
        $searchAccount->addFilter("mail ~ '%s'", preg_quote($mailExpr)); // filtre les mail qui contiennent george
        $accountList = $searchAccount->search();
        foreach ($accountList as $account) {
            printf("\t %s => %s\n", $account->login, $account->mail);
        }
    
    }

Résultat :

        george.abitbol => george.abitbol@classe-americaine.com
        georges.de.hanovre => georges.V.de.hanovre@hanovre.com
        georgette.agutte => georgette.agutte@paris.com


## Notes {#core-ref:7756d9a4-c80a-4fac-9a66-7c6c0fcbd682}

Aucunes

## Voir aussi {#core-ref:871d553e-0614-41a0-b4bd-2b52acd40cff}

* [`addGroupFilter`][addGroupFilter],
* [`addRoleFilter`][addRoleFilter],
* [chapitre sur la recherche des utilisateurs][advancedUserSearch].

<!-- links -->

[wikipediaInjectionSQL]:    https://fr.wikipedia.org/wiki/Injection_SQL "Injection SQL"
[dataAccount]:      #core-ref:6d5684f4-73e8-431c-8b2b-6224a9e6b074
[phpSprintf]:       http://us3.php.net/manual/en/function.sprintf.php "PHP : sprintf"
[pgEscape]:         http://us1.php.net/manual/en/function.pg-escape-string.php "PHP : pg_escape_string"
[preg_quote]:       http://us2.php.net/preg_quote "PHP : preg_quote"
[addGroupFilter]:   #core-ref:adef7a48-c4c8-45a9-a11f-dcb39d1daab6
[addRoleFilter]:    #core-ref:e31c0040-6b86-489a-8114-1be80b78603b
[advancedUserSearch]:   #core-ref:77224212-a4f3-4159-8a8a-c11c6f430f61