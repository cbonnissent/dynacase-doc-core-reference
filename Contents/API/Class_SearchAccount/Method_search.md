# SearchAccount::search() {#core-ref:bafd94a2-efae-4652-835b-0185a9f0e3bf}

<div markdown="1" class="short-description">
La méthode permet d'exécuter la recherche paramétrée avec les autres méthodes de
la classe et d'obtenir une liste de [account][account].
</div>

## Description {#core-ref:7b82d47a-a3ad-4c6e-a57d-6a24da09d7a4}

    [php]
    DocumentList|AccountList search()

Cette méthode exécute la recherche auprès de la base de données et retourne soit :

* une [`DocumentList`][documentList] : la documentList est un itérable sur les 
documents Dynacase associés aux comptes trouvés,
* une [`AccountList`][accountList] : l'accountList est un itérable sur les objets
account.

**Note** : C'est la méthode [`SearchAccount::setReturnType`][setReturnType] qui 
définit le type de retour.

### Avertissements {#core-ref:6ed280fc-7769-4f65-b14c-291a3811bb13}

Aucun

## Liste des paramètres {#core-ref:c504c93b-24c2-4569-a9a8-57fd7648a2dc}

Aucun

## Valeur de retour {#core-ref:06eb3909-c862-46ec-af68-74e943849d90}

[DocumentList|AccountList]

## Erreurs / Exceptions {#core-ref:a4545103-0c2c-49c5-bce2-599daa78538a}

Aucune

## Historique {#core-ref:d2624481-b4db-42b5-9a11-efca9ceece01}

Aucun

## Exemples {#core-ref:49bdf1f3-b02c-442f-a591-b1d93f15bf18}

Avoir la liste des utilisateurs et des groupes ayant le rôle `cash`:

    [php]
    
    function getCashPeople(Action & $action)
    {
        header('Content-Type: text/plain');
        
        $searchAccount = new SearchAccount();
        $searchAccount->addRoleFilter("cash");
        $accountList = $searchAccount->search();
        foreach ($accountList as $account) {
            printf("%s (type : %s)\n", $account->login, $account->accounttype);
        }
    }

Ce qui donne :

    george.abitbol (type : U)
    zoo.cashone (type : U)
    zoo.cashtwo (type : U)

## Notes {#core-ref:cc1b413c-8ab7-423f-9bd8-1c02d6626130}

Aucunes

## Voir aussi {#core-ref:19f28652-a7d0-4c75-9173-ee3736d60779}

* [`DocumentList`][documentList],
* [`AccountList`][accountList].

<!-- links -->

[account]:          #core-ref:22c7dec6-5ee7-4540-9b3b-7fb4b06d01d9
[documentList]:     #core-ref:23c71c28-dbce-4d34-819a-50d5bc4a38c3
[accountList]:      #core-ref:b48372db-c2a9-481a-a502-174f972484a3
[setReturnType]:    #core-ref:1f49220a-d0b0-4750-8c3d-34a50b955746
[return]:           #core-ref:7b82d47a-a3ad-4c6e-a57d-6a24da09d7a4