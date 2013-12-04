# SearchAccount::setOrder() {#core-ref:bc7439f0-71d5-448a-84bd-2dd7200969bd}

<div markdown="1" class="short-description">
Permet de définir l'ordre de tri des résultats.
</div>

## Description {#core-ref:ee963f2f-4971-403e-b7e0-8960875ba68e}

    [php]
    void setOrder ( string $order )

Cette méthode permet de définir l'ordre de tri des résultats de la recherche.

### Avertissements {#core-ref:98c90c4a-4936-4b21-8586-e1f5c702126b}

Aucun

## Liste des paramètres {#core-ref:795595df-5234-4841-ac7d-c56c1826719c}

(string) `order`
:   L'order doit être une des [propriété d'un objet account][propOrder].


## Valeur de retour {#core-ref:ef606e35-7a50-4e48-b726-04d401cade77}

Aucune

## Erreurs / Exceptions {#core-ref:9005723b-af94-4fb6-a83e-6ca67a44f781}

Aucun

## Historique {#core-ref:0005a96f-c330-433d-b7f6-7019c177f283}

Aucun

## Exemples {#core-ref:6fde40b1-8f8a-4190-b43e-5b519d41e47b}

    [php]
    
    function getCashPeople(Action & $action)
    {
        header('Content-Type: text/plain');
        
        print "Default order \n";
        $searchAccount = new SearchAccount();
        $accountList = $searchAccount->search();
        foreach ($accountList as $account) {
            printf("%s (type : %s)\n", $account->login, $account->accounttype);
        }
        print "Ordered by accounttype\n";
        $searchAccount = new SearchAccount();
        $searchAccount->setOrder("accounttype");
        $accountList = $searchAccount->search();
        foreach ($accountList as $account) {
            printf("%s (type : %s)\n", $account->login, $account->accounttype);
        }
    }

Ce qui donne :

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
    
    all (type : G)
    care (type : G)
    gadmin (type : G)
    security (type : G)
    cash (type : R)
    surveillant (type : R)
    veto (type : R)
    core_administrator (type : R)
    zoo.garde (type : U)
    zoo.cashone (type : U)
    zoo.cashtwo (type : U)
    admin (type : U)
    anonymous (type : U)
    zoo.veto (type : U)

## Notes {#core-ref:816a0a09-1995-4a86-b5e7-232ea558257d}

Aucunes

## Voir aussi {#core-ref:d3215ce0-98c9-44ac-96a9-fbd782a174f1}

* [addFilter][addFilter],
* [setSlice][setSlice],
* [setStart][setStart],
* [setTypeFilter][setTypeFilter].

<!-- links -->

[propOrder]:        #core-ref:6d5684f4-73e8-431c-8b2b-6224a9e6b074
[addFilter]:        #core-ref:e785ea85-d398-4b6f-8a14-0224f0a9e69f
[setSlice]:         #core-ref:c176d2c5-3ca5-4380-8644-9f084f094403
[setStart]:         #core-ref:06f99854-52b7-4c75-9b8d-b0383fb31ebe
[setTypeFilter]:    #core-ref:bdbaccb1-c6ca-4355-ba54-8762d020a522