# SearchAccount::addGroupFilter() {#core-ref:adef7a48-c4c8-45a9-a11f-dcb39d1daab6}

<div markdown="1" class="short-description">
Cette méthode permet de rechercher les comptes qui appartiennent à un groupe.
</div>

## Description {#core-ref:b34dc2f1-215b-4ac7-a02d-2151973cf241}

    [php]
    void addGroupFilter( string $groupName )

La méthode permet d'ajouter un filtre à la recherche, le groupName est basé sur
le login du groupe.

**Note** : Il est possible de rechercher sur plusieurs groupes en utilisant
plusieurs fois la méthode.

**Note** : La recherche par groupe prend aussi en compte les sous-groupes du
groupe  recherché.

**Note** : Si cette méthode est combinée à la méthode
[`SearchAccount::addRoleFilter`][addRoleFilter] cela filtre tous les comptes
qui appartiennent à un des groupes cités ou à un des rôles cités.

### Avertissements {#core-ref:4037ce2b-cf74-4868-a619-49d056b91590}

La recherche est basée sur l'objet [account][account] et pas sur l'objet 
documentaire associé au compte.

Par défaut, la recherche retourne des groupes et des utilisateurs, il est possible
de filtrer le type d'élément recherché à l'aide de 
[`SearchAccount::setTypeFilter`][setTypeFilter].

## Liste des paramètres {#core-ref:e092e81f-16b8-4224-a620-81e0b1078efa}

(string) `groupName`
:   Nom de l'identifiant (colonne `login`) du groupe de référence.

## Valeur de retour {#core-ref:9c7e4502-8c41-4707-87a8-07ee8fc701ea}

void

## Erreurs / Exceptions {#core-ref:0a7f96c5-4444-42a9-adbb-3ba41b32ea0c}

Si jamais le login de groupe demandé n'existe pas alors une exception de type
`Dcp\Sacc\Exception` est levée.

## Historique {#core-ref:3f32716a-6b80-442b-9862-c610fc1b41f5}

Aucun

## Exemple {#core-ref:9d6d6a67-070d-479f-aa7f-dddf2f83c875}

Avoir la liste des utilisateurs et des groupes contenus dans le groupe `all`:

    [php]
    $searchAccount = new SearchAccount();
    $searchAccount->addGroupFilter("all");
    $accountList = $searchAccount->search();
    foreach ($accountList as $account) {
        printf("%s (type : %s)\n", $account->login, $account->accounttype);
    }

Résultat :

    admin (type : U)
    care (type : G)
    gadmin (type : G)
    george.abitbol (type : U)
    georges.de.hanovre (type : U)
    georgette.agutte (type : U)
    security (type : G)
    zoo.cashone (type : U)
    zoo.cashtwo (type : U)
    zoo.garde (type : U)
    zoo.veto (type : U)

## Notes {#core-ref:988b99f7-b395-47d5-9cdd-52ea0dcd835e}

Un rôle ne peut pas être contenu dans un groupe d'utilisateur.

## Voir aussi {#core-ref:8d86532b-0eb5-4ddf-be87-d1685a196401}

* [`SearchAccount::addFilter()`][addFilter],
* [`SearchAccount::addRoleFilter()`][addRoleFilter],
* [chapitre sur les groupes][group],
* [chapitre avancé sur la recherche des utilisateurs][advancedSearch].


<!-- links -->

[addFilter]:            #core-ref:e785ea85-d398-4b6f-8a14-0224f0a9e69f
[addRoleFilter]:        #core-ref:e31c0040-6b86-489a-8114-1be80b78603b
[account]:              #core-ref:22c7dec6-5ee7-4540-9b3b-7fb4b06d01d9
[setTypeFilter]:        #core-ref:bdbaccb1-c6ca-4355-ba54-8762d020a522
[group]:                #core-ref:d3a9acde-f4fa-4a0b-8acc-1303f8e6b17e
[advancedSearch]:       #core-ref:bb14d2a0-abf6-470e-b226-186f15bc7784