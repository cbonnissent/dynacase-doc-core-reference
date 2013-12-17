# SearchAccount::addRoleFilter() {#core-ref:e31c0040-6b86-489a-8114-1be80b78603b}

<div markdown="1" class="short-description">
Cette méthode permet de rechercher les comptes qui possède un rôle.
</div>

## Description {#core-ref:c97f01df-2bfe-45bc-a3a4-331942167ff5}

    [php]
    void addRoleFilter( string $roleName )

La méthode permet d'ajouter un filtre à la recherche, le roleName est basé sur
le login du rôle.

**Note** : Il est possible de rechercher sur plusieurs rôles en utilisant
plusieurs fois la méthode.

**Note** : La recherche par rôle prend aussi compte des sous-groupes.

**Note** : Si cette méthode est combinée à la méthode 
[`SearchAccount::addGroupFilter`][addGroupFilter] cela
indique tous les comptes qui appartiennent à un des groupes cités ou à un des
rôles cités.

### Avertissements {#core-ref:9ff76f82-0b29-4fa2-ae0a-b318bbbab06b}

Aucun

## Liste des paramètres {#core-ref:b19d85ca-24db-4095-886c-16d48290bee2}

(string) `groupName`
:   Nom du login du rôle de référence.

## Valeur de retour {#core-ref:b5f684ac-a616-410a-bd22-bf3705794467}

void

## Erreurs / Exceptions {#core-ref:91f7adfd-e2fd-4567-b3ca-2f579c4b7efb}

Si jamais le login de groupe demandé n'existe pas alors une exception de type
`Dcp\Sacc\Exception` est levée.

## Historique {#core-ref:a8dafadc-527f-4be6-bed3-c8cb00ca4f4f}

Aucun

## Exemples {#core-ref:31a79b5e-2c16-4bbe-a55a-d8f26fa3d8a3}

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

## Notes {#core-ref:d73f7a81-8883-4f66-89b8-4f76809230ab}

Aucun

## Voir aussi {#core-ref:a754b0bf-5dc0-44a8-b355-68ced5f7bf65}

* [`addFilter`][addFilter],
* [`addGroupFilter`][addGroupFilter],
* [Chapitre de présentation des rôles][role],
* [chapitre avancé sur la recherche des utilisateurs][advancedSearch].

<!-- links -->

[addFilter]:            #core-ref:e785ea85-d398-4b6f-8a14-0224f0a9e69f
[addGroupFilter]:       #core-ref:adef7a48-c4c8-45a9-a11f-dcb39d1daab6
[account]:              #core-ref:22c7dec6-5ee7-4540-9b3b-7fb4b06d01d9
[setTypeFilter]:        #core-ref:bdbaccb1-c6ca-4355-ba54-8762d020a522
[role]:                 #core-ref:b9742040-0367-4a3d-a411-7195ec5fa7a4
[advancedSearch]:       #core-ref:b48372db-c2a9-481a-a502-174f972484a3
