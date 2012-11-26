# Action::Unregister
 
<div class=”short-description”>
Supprime une variable de session utilisateur.
</div>

<div class=”applicabilite”>
Applicable
</div>


## Description

    [php]
    bool unRegister(string $k)

La variable est supprimée de la session "paramètre" (nom de session : "*freedom_param*") de l'utilisateur.


### Avertissements

N/A

## Liste des paramètres

(string) `k`
: Nom de la variable de session à supprimer

## Valeur de retour

Retourne toujours *true*.

## Erreurs / Exceptions

Aucunes

## Historique

N/A

## Exemples

    [php]
    function myAction(Action &$action) {
       $key=$action->getArgument('keyword');
       // suppression de la clef si la nouvelle clef contient moins de 3 caractères
       if (mb_strlen($key) < 3) $action->unRegister('myLastSearchKey');
       else $action->register('myLastSearchKey',$key);
       $s=new SearchDoc($action->dbaccess,'MY_FAMILY');
       if ($key) {
         $s->addGeneralFilter($key);
       }
       $s->search();
    }

## Notes

N/A
## Voir aussi

* Voir Action::read()
* Voir Action::register()
