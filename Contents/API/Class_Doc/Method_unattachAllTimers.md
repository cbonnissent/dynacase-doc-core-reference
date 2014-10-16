# Doc::unattachAllTimers()  {#core-ref:92275bbd-f185-426d-90f5-d2595d76db19}

<div class="short-description" markdown="1">
Méthode utilisée pour détacher tous les minuteurs du document.
</div>

## Description  {#core-ref:c5de073f-1c78-41c8-9146-ad5b3a2f0ae6}

    [php]
    string unattachAllTimers(Doc $origin = null)

Cette méthode permet de supprimer tout ou un sous-ensemble de minuteurs associés
au document.

Si l'origine est vide, tous les minuteurs sont détachés.

Si l'origine est indiquée, seuls les minuteurs issus de cette origine sont
détachés.

### Avertissements  {#core-ref:9d2b28a4-c2c9-4e26-afb3-e4ad74d4ed33}

Aucuns.

## Liste des paramètres  {#core-ref:693890d6-43e4-4c3f-9571-0b493e660b19}

(Doc) `origin`
:   Filtre permettant de détacher un sous-ensemble. L'origine est donné
    par l'argument `origine` de la méthode 
    [`Doc::attachTimer()`][docattachtimer].

## Valeur de retour  {#core-ref:8f0ca295-c858-4044-9a62-315ad505d0be}

La valeur de retour est le message d'erreur. Un retour vide indique que
l'opération s'est bien déroulée.


## Erreurs / Exceptions  {#core-ref:564459d8-a0d8-4ba1-adb7-31921395c0f1}

Les cas de retours d'erreurs sont :

*   Erreur d'accès interne à la base de donnée

## Historique  {#core-ref:b0f349fd-b1c3-4e00-83ea-6d2f743cf948}

Aucun.

## Exemples  {#core-ref:0c1cf156-0649-47d4-84e3-788e09e2b57f}

### Détachement de tous les minuteurs

Deux minuteurs sont attaché au document n°1427. Le premier minuteur n°13509 est 
lié à l'origine n°1090. Le deuxième minuteur n'est pas lié.

Le but de cet exemple est de détacher les minuteurs liés à l'origine n°1090.

    [php]
    $myOrigin=new_doc("", 1090);
    $myDocument=new_doc("", 1427);
    $myFirstTimer=new_doc("", 13509);
    $mySecondTimer=new_doc("", 13510);
    
    $err=$myDocument->attachTimer($myFirstTimer, $myOrigin);
    $err.=$myDocument->attachTimer($mySecondTimer);
    print "Active timers:\n";
    print_r( $myDocument->getAttachedTimers());
    
    $err.=$myDocument->unattachAllTimers();
    
    print "After origin deletion :\n";
    if (empty($err)) {
      print_r( $myDocument->getAttachedTimers());
    } else {
      print "$err\n";
    }

Résultat : 

    Active timers:
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
                [attachdate] => 2014-10-16 10:12:00
                [referencedate] => 2014-10-16 13:12:00
                [tododate] => 2014-10-17 13:12:00
                [donedate] => 
                [actions] => a:3:{s:5:"state";s:0:"";s:5:"tmail";s:0:"";s:6:"method";s:12:"::myMethod()";}
                [result] => 
                [id] => 25
            )
        [1] => Array
            (
                [timerid] => 13510
                [level] => 0
                [originid] => 
                [docid] => 1427
                [title] => Éléonore
                [fromid] => 1059
                [attachdate] => 2014-10-16 10:12:00
                [referencedate] => 2012-10-01 05:00:00
                [tododate] => 2012-10-01 05:00:00
                [donedate] => 
                [actions] => a:3:{s:5:"state";s:0:"";s:5:"tmail";s:0:"";s:6:"method";s:12:"::myMethod()";}
                [result] => 
                [id] => 26
            )
    )

    After origin deletion :
    Array
    (
    )

Tous les minuteurs ont été détachés.

### Détachement en fonction de l'origine

Deux minuteurs sont attaché au document n°1427. Le premier minuteur n°13509 est 
lié à l'origine n°1090. Le deuxième minuteur n'est pas lié.

Le but de cet exemple est de détacher les minuteurs liés à l'origine n°1090.

    [php]
    $myOrigin=new_doc("", 1090);
    $myDocument=new_doc("", 1427);
    $myFirstTimer=new_doc("", 13509);
    $mySecondTimer=new_doc("", 13510);
    
    $err=$myDocument->attachTimer($myFirstTimer, $myOrigin);
    $err.=$myDocument->attachTimer($mySecondTimer);
    print "Active timers:\n";
    print_r( $myDocument->getAttachedTimers());
    
    $err.=$myDocument->unattachAllTimers($myOrigin);
    
    print "After origin deletion :\n";
    if (empty($err)) {
      print_r( $myDocument->getAttachedTimers());
    } else {
      print "$err\n";
    }

Résultat : 

    Active timers:
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
                [attachdate] => 2014-10-16 10:12:00
                [referencedate] => 2014-10-16 13:12:00
                [tododate] => 2014-10-17 13:12:00
                [donedate] => 
                [actions] => a:3:{s:5:"state";s:0:"";s:5:"tmail";s:0:"";s:6:"method";s:12:"::myMethod()";}
                [result] => 
                [id] => 25
            )
        [1] => Array
            (
                [timerid] => 13510
                [level] => 0
                [originid] => 
                [docid] => 1427
                [title] => Éléonore
                [fromid] => 1059
                [attachdate] => 2014-10-16 10:12:00
                [referencedate] => 2012-10-01 05:00:00
                [tododate] => 2012-10-01 05:00:00
                [donedate] => 
                [actions] => a:3:{s:5:"state";s:0:"";s:5:"tmail";s:0:"";s:6:"method";s:12:"::myMethod()";}
                [result] => 
                [id] => 26
            )
    )

    After origin deletion :
    Array
    (
        [0] => Array
            (
                [timerid] => 13510
                [level] => 0
                [originid] => 
                [docid] => 1427
                [title] => Éléonore
                [fromid] => 1059
                [attachdate] => 2014-10-16 10:12:00
                [referencedate] => 2012-10-01 05:00:00
                [tododate] => 2012-10-01 05:00:00
                [donedate] => 
                [actions] => a:3:{s:5:"state";s:0:"";s:5:"tmail";s:0:"";s:6:"method";s:12:"::myMethod()";}
                [result] => 
                [id] => 26
            )
    )

Seuls les minuteurs liés à l'origine n°1090 ont été détachés.

## Notes  {#core-ref:abe99d60-53a9-448c-9430-cc2279e9f3ec}

Une entrée, de niveau *notice*, est enregistrée dans l'historique pour indiquer
le détachement des minuteurs.

## Voir aussi  {#core-ref:c2860ee3-853e-4179-bdd6-7d35a88226af}


*   [`Doc::attachTimer()`][docattachtimer],
*   [`Doc::unattacheTimer()`][docunattachtimer]

<!-- links -->
[docstore]:         #core-ref:b8540d13-ece6-4e9e-9b72-6a56bca9da12
[docunattachtimer]: #core-ref:0449b66d-e5ba-4fb6-88b5-5c69a1a4c27b
[docgetattachedtimers]:   #core-ref:3868bb5d-4847-4877-85f7-13be92430fe8
[dyndate]:          #core-ref:386637d4-ab5b-4b3b-bf80-f2e6c226c555
[docattachtimer]:   #core-ref:d40860f3-d0ba-4cff-b2e8-76ddfa08c600