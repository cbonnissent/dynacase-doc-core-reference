# la fonction `SimpleQuery` {#core-ref:db34809e-c566-4a80-8b72-dc185c9de9e2}

<div class="short-description" markdown="1">

Cette fonction permet d'envoyer une requête sur la base de données.

</div>


## Description {#core-ref:a2b0ccba-6d94-4bd6-8a4d-26208f0e4440}

    [php]
    string simpleQuery (string $dbaccess,
                        string $query,
            array|string|bool &$result       = array() ,
                          bool $singlecolumn = false,
                          bool $singleresult = false,
                     bool|null $useStrict    = null)

Cette fonction permet de récupérer facilement les données directement depuis la
base de données.

### Avertissements {#core-ref:d651f51e-e3d5-42fd-b6e1-83e1e3a2d7ac}

La requête est exécutée directement. Il est de la responsabilité du développeur
de s'assurer de la validité de la requête et d'éviter les injections.

## Liste des paramètres {#core-ref:8cdf0c93-c52b-4861-8299-852d49a9f074}

(string) `dbaccess`  
:   Les coordonnées de la base de données. Si cette valeur est vide, ce sont
    les coordonnées de la base Dynacase qui seront utilisées.

(string) `query`  
:   la requête sql a exécuter

(array|string|bool) `result`  
:   La forme du résultat dépend des paramètres `singlecolumn` et
    `singleresult` :
    
    `singlecolumn = false` et `singleresult = false`
    :   Le résultat est un tableau à deux dimensions.  
        Chaque rangée de premier niveau contient un tableau indexé avec les
        noms des colonnes retournées.
        
        Si aucun résultat pour la requête n'est trouvé, le résultat 
        est un tableau vide.
    
    `singlecolumn = false` et `singleresult = true`
    :   Le résultat est un tableau indexé.  
        L'index correspond aux noms des colonnes retournées.
        
        Si aucun résultat pour la requête n'est trouvé, la valeur retournée
        est un tableau vide.
    
    `singlecolumn = true` et `singleresult = false`
    :   Le résultat est un tableau.  
        Chaque élément du tableau contient la valeur de la première colonne du 
        `select`.
        
        Si aucun résultat pour la requête n'est trouvé, la valeur retournée
        est un tableau vide.
    
    `singlecolumn = true` et `singleresult = true`
    :   Le résultat est une chaîne de caractère.  
        Elle contient la valeur de la première colonne du premier résultat trouvé.
        
        Si aucun résultat pour la requête n'est trouvé, la valeur retournée
        est `false`.

(bool) `singlecolumn`
:   Mettre à `true` si une seule colonne doit être retournée.

(bool) `singleresult`
:   Mettre à `true` si un seul résultat doit être retourné.

(bool|null) `useStrict`  
:   Si `false` : en cas d'erreur pas d'exception déclenchée mais une erreur
    retournée  
    Si `true` : en cas d'erreur une exception est déclenchée.
    Si `null` : traitement d'erreur par défaut (se reporter au paramètre
    applicatif `CORE_SQLSTRICT`).

## Valeur de retour {#core-ref:7cb819c8-adfa-49d4-8fb6-14276b624396}

`string`
:   Message d'erreur si l'argument `useStrict` est `false`.

## Erreurs / Exceptions {#core-ref:60ee79bb-6114-47ec-a167-40c2293fc507}

-   Si `useStrict` est `false` alors un message d'erreur est retourné. Si le
    message est vide, cela indique que la requête s'est déroulée correctement.
-   Si `useStrict` est `true` une exception `\Dcp\Db\Exception` est déclenchée
    si la requête échoue.
-   Si `useStrict` est `null` (valeur par défaut), le retour d'erreur dépend du
    paramètre applicatif `CORE_SQLSTRICT`. Par défaut, la valeur
    `CORE_SQLSTRICT` est `yes`, ce qui est équivalent à `useStrict` est `true`.

## Historique {#core-ref:ca7f61e1-0560-4799-b367-0f850a815efb}

Aucun.

## Exemples {#core-ref:1dafca9b-1f7d-456a-af1e-ba2fbef022c3}

### Requête générale {#core-ref:a294931c-f7fa-42a6-9ffa-11d59ae07f43}

Récupération des identifiants login des 3 premiers comptes trouvés.

    [php]
    $sql = sprintf("SELECT id, login FROM users LIMIT 3");
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

### Requête un seul résultat et plusieurs colonnes {#core-ref:d7eb508a-596c-45e3-9158-0e78716ef9bf}

Récupérer le login et l'adresse de courriel de l'utilisateur n°14.

    [php]
    $idUser=14;
    $sql = sprintf("SELECT login, mail FROM users WHERE id=%d", $idUser);
    simpleQuery('', $sql, $results, false, true);
    
    print_r($results); 

Résultat :

    Array
    (
        [login] => cash
        [mail] => cash@example.net
    )

### Requête plusieurs résultats et une seule colonne {#core-ref:4a3f6cea-2fbe-45c0-b5c8-398892373f07}

Récupération des références des groupes d'utilisateurs :

    [php]
    $sql = sprintf("SELECT login FROM users WHERE accounttype='G'");
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


### Requête un seul résultat et une seule colonne {#core-ref:bc013dd5-db27-468c-9484-9300cd943b98}

Récupérer le login et l'adresse de courriel de l'utilisateur dont le login est
*zoo.userone*.

    [php]
    $userLogin="zoo.userone";
    $sql = sprintf("SELECT mail FROM users WHERE login='%s'", 
                    pg_escape_string($userLogin));
    simpleQuery('', $sql, $result, true, true);
    printf("mail = [%s]\n",$result); 

Résultat :

    mail = [one@example.net]

**Note** : Ne pas oublier d'échapper les chaînes de caractères lors de la
composition d'une requête avec des variables de chaîne de caractère.

## Voir aussi {#core-ref:135ccee1-9574-4446-a736-5e02216f8b47}

*   [Classe `DbObj`][dbobj]
*   [`SearchDoc::search()`][searchdocsearch]


<!-- links -->

[SearchDoc]:        #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255
[searchdocsearch]:  #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08
[dbobj]:            #core-ref:7a62bb83-17a0-478d-a853-bc359d0fb8fb