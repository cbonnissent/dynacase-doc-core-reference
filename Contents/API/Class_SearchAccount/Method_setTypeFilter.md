# SearchAccount::setTypeFilter() {#core-ref:bdbaccb1-c6ca-4355-ba54-8762d020a522}

<div class="short-description">
Permet de filtrer pour ne retourner qu'un ou plusieurs types de comptes.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:5c4ec1df-dea4-4499-9c08-cad6499e0aee}

    [php]
    void setTypeFilter ( int $type )

Le type utilise la notion de [masque binaire][wfr_bitmask]. On peut donc 
rechercher à la fois :

* les utilisateurs,
* les groupes,
* les comptes.

Et une composition de ces trois éléments (les groupes étant des
utilisateurs ou des groupe, etc.).

Pour composer une recherche sur plusieurs types, on utilise l'opérateur PHP
binaire `|`.

### Avertissements {#core-ref:50c7715e-3b4d-46bf-94bc-59cd10198f72}

Aucun

## Liste des paramètres {#core-ref:b911e91e-7ac7-49b8-8183-f157d404f0c1}

(int) `type`
:   Le type est un ou une composition des constantes de classes :
    
     * *userType* : les comptes de type utilisateur,
     * *groupType* : les comptes de type groupe;
     * *roleType* : les comptes de type rôle.

## Valeur de retour {#core-ref:8e9da282-5ca7-4f5c-80c1-759d167414c2}

`void`

## Erreurs / Exceptions {#core-ref:e91945c5-f1b5-429d-91b4-81a7470044be}

Aucune

## Historique {#core-ref:14ef48a9-396f-4d6e-897c-9cca4e11711c}

Aucun

## Exemples {#core-ref:2d6947c5-9427-4a5e-93c2-63c6cf379a5f}

    [php]
    function setTypeFilter(Action & $action)
    {
        header('Content-Type: text/plain');
        
        print "Without any type filter \n-----------------------\n";
        $searchAccount = new SearchAccount();
        $accountList = $searchAccount->search();
        foreach ($accountList as $account) {
            printf("%s (type : %s)\n", $account->login, $account->accounttype);
        }
        print "\nOnly user \n-----------------------\n";
        $searchAccount = new SearchAccount();
        $searchAccount->setTypeFilter(SearchAccount::userType);
        $accountList = $searchAccount->search();
        foreach ($accountList as $account) {
            printf("%s (type : %s)\n", $account->login, $account->accounttype);
        }
        print "\nUser and role \n-----------------------\n";
        $searchAccount = new SearchAccount();
        $searchAccount->setTypeFilter(SearchAccount::groupType | SearchAccount::roleType);
        $accountList = $searchAccount->search();
        foreach ($accountList as $account) {
            printf("%s (type : %s)\n", $account->login, $account->accounttype);
        }

Produit le retour :

    Without any type filter 
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
    
    Only user 
    -----------------------
    admin (type : U)
    anonymous (type : U)
    zoo.cashone (type : U)
    zoo.cashtwo (type : U)
    zoo.garde (type : U)
    zoo.veto (type : U)
    
    User and role 
    -----------------------
    all (type : G)
    care (type : G)
    cash (type : R)
    core_administrator (type : R)
    gadmin (type : G)
    security (type : G)
    surveillant (type : R)
    veto (type : R)


## Notes {#core-ref:f7e05f6b-1567-44ea-9410-ea8d9c7ee96f}

Aucun

## Voir aussi {#core-ref:ae3fbe74-614a-46c8-a97f-cc38bd8899a4}

* [addFilter][addFilter],
* [setSlice][setSlice],
* [setOrder][setOrder].

<!-- links -->

[addFilter]:        #core-ref:e785ea85-d398-4b6f-8a14-0224f0a9e69f
[setSlice]:         #core-ref:c176d2c5-3ca5-4380-8644-9f084f094403
[setStart]:         #core-ref:06f99854-52b7-4c75-9b8d-b0383fb31ebe
[setOrder]:         #core-ref:bc7439f0-71d5-448a-84bd-2dd7200969bd
[wfr_bitmask]:          https://fr.wikipedia.org/wiki/Masque_(informatique) "wikipedia : Bitmask"