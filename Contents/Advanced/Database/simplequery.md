# SimpleQuery


<div class="short-description" markdown="1">

Cette fonction permet d'envoyer une requête sur la base de données.

</div>


## Description  

    [php]
    string simpleQuery (string $dbaccess, 
                        string $query, 
            array|string|bool &$result       = array() , 
                          bool $singlecolumn = false, 
                          bool $singleresult = false, 
                     bool|null $useStrict    = null)

Cette fonction permet de récupérer facilement les données directement depuis la
base de données.

### Avertissements 

La requête est exécutée directement. Il est de la responsabilité du développeur
de s'assurer de la validité de la requête et d'éviter les injections.

## Liste des paramètres  

(string) `dbaccess`  
:   Les coordonnées de la base de données. Si cette valeur est vide, ce sont les
    coordonnées de la base Dynacase qui seront utilisées.


(string) `query`  
:   la requête sql a exécuter


(array|string|bool) `result`  
:   La forme du résultat dépend des paramètres `singlecolumn` et `singleresult`.

*   Si `singlecolumn = false` et `singleresult = false`
        Le résultat est un tableau à deux dimensions. 
        Chaque rangée de premier niveau contient un tableau indexé avec les noms
        des colonnes retournées.
        Si aucun résultat pour la requête n'est trouvé, le résultat 
        donnée est un tableau vide.  
*   Si `singlecolumn = false` et `singleresult = true`
    :   Le résultat est un tableau indexé. 
        L'index correspond aux noms des colonnes retournées.
        Si aucun résultat pour la requête n'est trouvé, le résultat 
        donnée est un tableau vide.  
*   Si `singlecolumn = true` et `singleresult = false`
    :   Le résultat est un tableau. 
        Chaque élément du tableau contient la valeur de la première colonne du 
        `select`. Si aucun résultat pour la requête n'est trouvé, le résultat 
        donnée est un tableau vide.  
*   Si `singlecolumn = true` et `singleresult = true`
    :   Le résultat est une chaîne de caractère. 
        Elle contient la valeur de la première colonne du premier résultat trouvé.
        Si aucun résultat n'est trouvé, la valeur retourné est `false`.


(bool) `singlecolumn`  
:   Mettre à `true` si une seule colonne doit être retournée.


(bool) `singleresult`  
:   Mettre à `true` si un seul résultat retourné.

(bool|null) `useStrict`  
:   Si `false` : en cas d'erreur pas d'exception déclenchée mais une erreur
    retournée  
    Si `true` : en cas d'erreur une exception est déclenchée.
    Si `null` : traitement d'erreur par défaut.

## Valeur de retour  

`string`
:   Message d'erreur si l'argument `useStrict` est `false`. 

La liste des [attributs][docattr] et [propriétés][docprop] qui seront
effectivement retournés.

## Erreurs / Exceptions  

Si `useStrict` est `false` alors un message d'erreur est retourné. Si le message
est vide, cela indique que la requête s'est déroulée correctement.

Si `useStrict` est `true` une exception `\Dcp\Db\Exception` est déclenchée si la
requête échoue.

Si `useStrict` est `null` (valeur par défaut), le retour d'erreur dépend du
paramètre applicatif `CORE_SQLSTRICT`. Par défaut, la valeur `CORE_SQLSTRICT`
est `yes`, cela implique que `useStrict` est `true`.


## Historique  

Aucun.


## Exemples  

### Requête générale

Récupération des identifiants et des login des 3 premiers comptes trouvés.

    [php]
    $sql = sprintf("select id, login from users limit 3");
    simpleQuery('', $sql, $results);
    print_r($results);

Résultat :

    Array
    (
        [0] => Array
            (
                [id] => 14
                [login] => cash
            )
        [1] => Array
            (
                [id] => 15
                [login] => zoo.garde
            )
        [2] => Array
            (
                [id] => 16
                [login] => zoo.veto
            )
    )

### Requête un seul résultat et plusieurs colonnes

Récupérer le login et l'adresse de courriel de l'utilisateur n°14.

    [php]
    $idUser=14;
    $sql = sprintf("select login, mail from users where id=%d", $idUser);
    simpleQuery('', $sql, $results, false, true);
    
    print_r($results); 

Résultat :

    Array
    (
        [login] => cash
        [mail] => cash@example.net
    )



### Requête un seul résultat et plusieurs colonnes

Récupération des références des groupes d'utilisateur :

    [php]
    $sql = sprintf("select login from users where accounttype='G'");
    simpleQuery('', $sql, $results, true, false);
    print_r($results);

Résultat :

    Array
    (
        [0] => all
        [1] => gadmin
        [2] => security
        [3] => care
    )


### Requête un seul résultat et une seule colonne

Récupérer le login et l'adresse de courriel de l'utilisateur n°14.

    [php]
    $userLogin="zoo.userone";
    $sql = sprintf("select mail from users where login='%s'", 
                    pg_escape_string($userLogin));
    simpleQuery('', $sql, $result, true, true);
    printf("mail = [%s]\n",$result); 

Résultat :

    mail = [one@example.net]

**Note** : Ne pas oublier d'échapper les chaînes de caractères lors de la
composition d'une requête avec des variables de chaîne de caractère.

## Voir aussi  

*   [Classe `DbObj`][dbobj]
*   [`SearchDoc::search()`][searchdocsearch]


<!-- links -->

[SearchDoc]:        #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255
[searchdocsearch]:  #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08
[dbobj]:            #core-ref:7a62bb83-17a0-478d-a853-bc359d0fb8fb