# SearchAccount::overrideViewControl() {#core-ref:15b74918-3801-471a-bb1e-a83b560636cc}

<div class="short-description">
Cette méthode permet de ne pas prendre en compte les droit view associé au document
associé au compte.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:0a199411-b3d1-467c-881e-0b2cdb6dbe78}

    [php]
    void overrideViewControl ( bool $override )

Cette méthode permet d'indiquer que l'on souhaite trouver même les documents
que l’utilisateur n'a pas le droit de voir.

### Avertissements {#core-ref:e39f6084-64bd-4091-acdb-ead9f4d94e4a}

Aucun

## Liste des paramètres {#core-ref:79d89651-79e3-4125-a345-6491fa2ce8d6}

(bool) `override` (défaut : true)
:   Si override est à `true` alors le droit view n'est pas pris en compte et
    l'ensemble des documents est retourné.

## Valeur de retour {#core-ref:037df943-5c33-4e24-ad14-2353b1356dcf}

`void`

## Erreurs / Exceptions {#core-ref:48e156ad-237c-413f-871a-5b8cdb732e03}

Aucune

## Historique {#core-ref:e4510c70-4665-4893-a1b3-c667c8ce0dc2}

Cette méthode remplace la méthode `useViewControl`.  **Attention** : la méthode
useViewControl fonctionnait à l'opposé de la méthode `overrideViewControl`, 
c'est à dire que le booléen positif indiquait que le droit voir est pris en 
compte, alors que actuellement il indique qu'il n'est pas pris en compte.

## Exemples {#core-ref:fa8d25c6-2838-40da-8ed8-5c1c1ad56a3a}

    [php]
    function setTypeFilter(Action & $action)
    {
        header('Content-Type: text/plain');
        
        print "Without override \n-----------------------\n";
        $searchAccount = new SearchAccount();
        $accountList = $searchAccount->search();
        foreach ($accountList as $account) {
            printf("%s (type : %s)\n", $account->login, $account->accounttype);
        }
        print "\nWith override \n-----------------------\n";
        $searchAccount = new SearchAccount();
        $searchAccount->overrideViewControl();
        $accountList = $searchAccount->search();
        foreach ($accountList as $account) {
            printf("%s (type : %s)\n", $account->login, $account->accounttype);
        }
    }
    

Retour :

    Without override 
    -----------------------
    care (type : G)
    cash (type : R)
    core_administrator (type : R)
    gadmin (type : G)
    security (type : G)
    surveillant (type : R)
    veto (type : R)
    zoo.cashone (type : U)
    zoo.cashtwo (type : U)
    zoo.garde (type : U)
    zoo.veto (type : U)
    
    With override 
    -----------------------
    admin (type : U)
    all (type : G)
    anonymous (type : U)
    care (type : G)
    cash (type : R)
    core_administrator (type : R)
    gadmin (type : G)
    security (type : G)
    surveillant (type : R)
    veto (type : R)
    zoo.cashone (type : U)
    zoo.cashtwo (type : U)
    zoo.garde (type : U)
    zoo.veto (type : U)

## Notes {#core-ref:b0faa89d-08e9-468d-8e51-fdc7b739f4ba}

Aucunes

## Voir aussi {#core-ref:6002ce14-3785-4b3e-99fc-32a8340345cb}

* [addFilter][addFilter],
* [setStart][setStart],
* [setSlice][setSlice],
* [setOrder][setOrder].

<!-- links -->

[addFilter]:        #core-ref:e785ea85-d398-4b6f-8a14-0224f0a9e69f
[setSlice]:         #core-ref:c176d2c5-3ca5-4380-8644-9f084f094403
[setStart]:         #core-ref:06f99854-52b7-4c75-9b8d-b0383fb31ebe
[setOrder]:         #core-ref:bc7439f0-71d5-448a-84bd-2dd7200969bd
