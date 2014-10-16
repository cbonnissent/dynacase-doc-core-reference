# Doc::getAttachedTimer()  {#core-ref:3868bb5d-4847-4877-85f7-13be92430fe8}

<div class="short-description" markdown="1">
Méthode utilisée récupérer les informations des minuteurs attachés au document.
</div>

## Description  {#core-ref:0b0037fa-d4ef-41ec-bc15-43095db7f6c3}

    [php]
    array getAttachedTimer (  )

Cette méthode renvoie les informations des minuteurs qui sont attachés au
document.

### Avertissements  {#core-ref:1267f7d3-c33e-406d-8fc9-89af33ae4fc8}

Aucun.

## Liste des paramètres  {#core-ref:c50237d2-60a7-4f73-beae-858133cd07a1}

Aucun

## Valeur de retour  {#core-ref:f646cef6-acbf-4542-a811-13ba9f85f520}

Le retour est un tableau de valeur indexé. Si le tableau est vide, alors aucun
minuteur n'est attaché au document.

|      Clef     |                          Description                           |                                    Exemple                                    |
| ------------- | -------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| timerid       | Identifiant du document *Timer*                                | 13510                                                                         |
| level         | Niveau atteint par le minuteur                                 | 0                                                                             |
| originid      | Identifiant du document  *Origine*                             |                                                                               |
| docid         | Identifiant initial (`initid`) du document portant le minuteur | 1427                                                                          |
| title         | Titre  du document portant le minuteur                         | Éléonore                                                                      |
| fromid        | Identifiant de la famille   du document portant le minuteur    | 1059                                                                          |
| attachdate    | Date d'attachement du minuteur                                 | 2014-10-15 17:24:00                                                           |
| referencedate | Date de référence du minuteur                                  | 2012-10-01 05:00:00                                                           |
| tododate      | Date de prochaine échéance                                     | 2012-10-01 05:00:00                                                           |
| donedate      | Date à laquelle l'action a été exécutée                        |                                                                               |
| actions       | Actions à faire (chaîne serialisée)                            | a:3:{s:5:"state";s:0:"";s:5:"tmail";s:0:"";s:6:"method";s:12:"::myMethod()";} |
| result        | Résultat de l'action                                           |                                                                               |
| id            | Identifiant de l'attachement                                   | 22                                                                            |

Seuls les attachements actifs sont retournés. Les actions effectuées ne sont pas 
retournées.

## Erreurs / Exceptions  {#core-ref:24430e02-a1a6-4e72-a0c7-a7967b4497f6}

Aucunes.

## Historique  {#core-ref:e46ea0c5-e88e-42a2-a18a-7b434bdd6fd2}

Aucun.

## Exemples  {#core-ref:d2c7fadd-1644-45d4-9d5d-0a5c28cb5c78}

Deux minuteurs sont attaché au document n°1427. Le premier minuteur n°13509 est 
lié à l'origine n°1090. Le deuxième minuteur n'est pas lié.

    [php]
    $myOrigin=new_doc("", 1090);
    $myDocument=new_doc("", 1427);
    $myFirstTimer=new_doc("", 13509);
    $mySecondTimer=new_doc("", 13510);
    $err=$myDocument->attachTimer($myFirstTimer, $myOrigin);
    $err=$myDocument->attachTimer($mySecondTimer);
    print "Attachements:\n";
    if (empty($err)) {
      print_r( $myDocument->getAttachedTimers());
    } else {
      print "$err\n";
    }

Résultat :

    Attachements
    Array
    (
        [0] => Array
            (
                [timerid] => 13509
                [level] => 0
                [originid] => 1090
                [docid] => 1427
                [title] => Éléonore
                [fromid] => 1059
                [attachdate] => 2014-10-16 10:19:00
                [referencedate] => 2014-10-16 13:19:00
                [tododate] => 2014-10-17 13:19:00
                [donedate] => 
                [actions] => a:3:{s:5:"state";s:0:"";s:5:"tmail";s:0:"";s:6:"method";s:12:"::myMethod()";}
                [result] => 
                [id] => 31
            )
        [1] => Array
            (
                [timerid] => 13510
                [level] => 0
                [originid] => 
                [docid] => 1427
                [title] => Éléonore
                [fromid] => 1059
                [attachdate] => 2014-10-16 10:19:00
                [referencedate] => 2012-10-01 05:00:00
                [tododate] => 2012-10-01 05:00:00
                [donedate] => 
                [actions] => a:3:{s:5:"state";s:0:"";s:5:"tmail";s:0:"";s:6:"method";s:12:"::myMethod()";}
                [result] => 
                [id] => 32
            )
    )



## Notes  {#core-ref:ea009b47-e2c6-4e96-9175-88b2cfbcd662}

Aucunes.

## Voir aussi  {#core-ref:6173875b-ba01-4423-a369-362c64ca6317}


*   [`Doc::attachTimer()`][docattachtimer],

<!-- links -->
[docstore]:         #core-ref:b8540d13-ece6-4e9e-9b72-6a56bca9da12
[docunattachtimer]: #core-ref:0449b66d-e5ba-4fb6-88b5-5c69a1a4c27b
[docgetattachedtimers]:   #core-ref:3868bb5d-4847-4877-85f7-13be92430fe8
[dyndate]:          #core-ref:386637d4-ab5b-4b3b-bf80-f2e6c226c555
[docattachtimer]:   #core-ref:d40860f3-d0ba-4cff-b2e8-76ddfa08c600