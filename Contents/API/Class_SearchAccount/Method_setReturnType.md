# SearchAccount::setReturnType() {#core-ref:1f49220a-d0b0-4750-8c3d-34a50b955746}

<div markdown="1" class="short-description">
Permet de choisir le type de retour de l'objet searchAccount. Par défaut, le 
retour est une [`AccountList`][accountList].
</div>


## Description {#core-ref:4ba97c47-68de-45d2-862e-8738b01783a4}

    [php]
    void setObjectReturn ( string $type )

Deux types de retour sont possibles soit :

* un objet [`DocumentList`][documentList] : la documentList est un itérable sur
les documents Dynacase associés aux comptes trouvés,
* un objet [`AccountList`][accountList] : l'accountList est un itérable sur les 
objets account.

### Avertissements {#core-ref:3c58bc85-50b0-4ac0-bb59-8d1e867cbabc}

Aucun

## Liste des paramètres {#core-ref:54fbb55d-fd45-4cb5-8d59-0a4089737fdb}

(string) `type`
:   Le type est une string qui est au choix entre deux constantes de classe, 
    soit :
    
     * SearchAccount::returnAccount : le retour est alors une accountList,
     * SearchAccount::returnDocument : le retour est alors une documentList.

## Valeur de retour {#core-ref:049c16a1-9cf9-4a43-be90-23e16a825d60}

`void`

## Erreurs / Exceptions {#core-ref:b6926633-bedd-4958-bc13-c91e82162934}

Si le type n'est pas une des deux constantes de classe alors une exception de 
type `Dcp\Sacc\Exception` est levée.

## Historique {#core-ref:070edaf1-d8f6-4a21-9b6f-8973d0054eda}

Cette méthode remplace la méthode `::setObjectReturn()`.

## Exemple {#core-ref:87a04fdd-ccb3-41e7-86b6-f15dee351dcb}

    [php]
    print "Return account \n";
    $searchAccount = new SearchAccount();
    $searchAccount->setReturnType(SearchAccount::returnAccount);
    $accountList = $searchAccount->search();
    foreach ($accountList as $account) {
        printf("%s \n", get_class($account));
    }
    print "\n";
    print "Return document \n";
    $searchAccount = new SearchAccount();
    $searchAccount->setReturnType(SearchAccount::returnDocument);
    $documentList = $searchAccount->search();
    foreach ($documentList as $currentDocument) {
        printf("%s \n", get_class($currentDocument));
    }

Résultat :

    Return account 
    Account 
    Account 
    Account 
    Account 
    Account 
    Account 
    Account 
    Account 
    Account 
    Account 
    Account 
    Account 
    Account 
    Account 


    Return document 
    Dcp\Family\Igroup 
    Dcp\Family\Role 
    Dcp\Family\Iuser 
    Dcp\Family\Zoo_gardien 
    Dcp\Family\Role 
    Dcp\Family\Iuser 
    Dcp\Family\Iuser 
    Dcp\Family\Iuser 
    Dcp\Family\Role 
    Dcp\Family\Igroup 
    Dcp\Family\Zoo_veterinaire 
    Dcp\Family\Igroup 
    Dcp\Family\Igroup 
    Dcp\Family\Role 


## Notes {#core-ref:1fa3ac22-ad2f-4434-a1e1-55aa54e304b5}

Aucunes

## Voir aussi {#core-ref:22ff3ee6-9769-444d-9325-6140e9d2174b}

* [SearchAccount::addFilter()][addFilter],
* [SearchAccount::setSlice()][setSlice],
* [SearchAccount::setStart()][setStart],
* [SearchAccount::setOrder()][setOrder].

<!-- links -->

[addFilter]:        #core-ref:e785ea85-d398-4b6f-8a14-0224f0a9e69f
[setSlice]:         #core-ref:c176d2c5-3ca5-4380-8644-9f084f094403
[setStart]:         #core-ref:06f99854-52b7-4c75-9b8d-b0383fb31ebe
[setOrder]:         #core-ref:bc7439f0-71d5-448a-84bd-2dd7200969bd
[documentList]:     #core-ref:23c71c28-dbce-4d34-819a-50d5bc4a38c3
[accountList]:      #core-ref:b48372db-c2a9-481a-a502-174f972484a3