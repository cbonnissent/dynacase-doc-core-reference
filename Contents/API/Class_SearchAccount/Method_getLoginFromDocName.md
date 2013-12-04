# SearchAccount::getLoginFromDocName() {#core-ref:9308d6a9-1d7d-4c61-b0c2-a25fdfbacd9b}

<div markdown="1" class="short-description">
Cette méthode permet de transformer un [nom logique de document][logicalName] en
 login d'account.
</div>

## Description {#core-ref:8d9613ce-0618-46a6-b299-0a3f4fd5bdd4}

    [php]
    string|null getLoginFromDocName( string $name )

La méthode est `static` est peut être utilisée sans instancier d'objet 
SearchAccount.

### Avertissements {#core-ref:7426a0db-63f1-4ccd-b68b-0bf243472577}

Aucun

## Liste des paramètres {#core-ref:d9c036ef-2c99-4ec7-8e3f-6a77eafa5c9e}

(string) `name`
:   Nom logique du document contenant la référence vers le account.

## Valeur de retour {#core-ref:5995158f-04b5-4497-a796-38f1bf034713}

`String` : login de l'account.

## Erreurs / Exceptions {#core-ref:edc34591-0355-4cf0-97ef-a7a499e14522}

Si jamais il n'existe pas d'account associé au nom logique alors `null` est 
renvoyé.

## Historique {#core-ref:2a6eb07f-6f93-4dcc-8cb9-b62ab0250825}

Aucun

## Exemples {#core-ref:85c34b89-f830-4e53-b6d5-3c0f23380feb}

    [php]
    function testOfGetLogin(Action & $action)
    {
        header('Content-Type: text/plain');
        
        print "\nLe nom logique n'existe pas\n";
        var_export(SearchAccount::getLoginFromDocName("toto"));
        print "\nLe nom logique existe mais le document associé n'est pas lié à un account\n";;
        var_export(SearchAccount::getLoginFromDocName("TEST"));
        print "\n";
        print "Le nom logique existe et est associé à un document qui est associé à un account\n";
        var_export(SearchAccount::getLoginFromDocName("ZOO_ROLE_VETO"));
    }

Résultat :

    Le nom logique n'existe pas
    false
    Le nom logique existe mais le document associé n'est pas lié à un account
    false
    Le nom logique existe et est associé à un document qui est associé à un account
    'veto'

## Notes {#core-ref:0b96f7b4-6517-4d9d-83e2-be8a86f263b1}

Aucunes

## Voir aussi {#core-ref:349dce37-7b6b-43e3-80f6-478dc47f8718}

* [`addGroupFilter`][addGroupFilter],
* [`addRoleFilter`][addRoleFilter].

<!-- links -->

[logicalName]:              #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353
[addGroupFilter]:           #core-ref:adef7a48-c4c8-45a9-a11f-dcb39d1daab6
[addRoleFilter]:            #core-ref:e31c0040-6b86-489a-8114-1be80b78603b