# Doc::attachTimer()  {#core-ref:d40860f3-d0ba-4cff-b2e8-76ddfa08c600}

<div class="short-description" markdown="1">
Méthode utilisée pour attacher un minuteur au document
</div>

## Description  {#core-ref:c79dab11-0c6e-4b5a-95bb-d385ff4f9a98}

    [php]
    string attachTimer ( Dcp\Family\Timer $timer, 
                                      Doc $origin = null, 
                                   string $execdate = null) 

Cette méthode permet d'attacher un minuteur particulier sur le document. 

### Avertissements  {#core-ref:b1b718c6-012a-4bda-851a-83cdece892ea}

Le même minuteur ne peut pas être attaché plusieurs fois sur le même document.

Si le paramètre `$execdate` est non vide, la caractéristique
[dynamique][dyndate] `tm_dyndate` d'un minuteur est ignorée.

Le minuteur ne peux pas être posé sur une révision précise du document. Les
minuteurs sont attachés sur la dernière révision du document.


## Liste des paramètres  {#core-ref:5f05f662-e8a1-49cb-85e2-90625a5dc8f9}

(Dcp\Family\Timer) `timer`
:   Document [*Minuteur*][doctimer] qui doit être attaché au document

(Doc) `origin`
:   Document ayant initié l'attachement. Ce paramètre optionnel permet 
    d'identifier un attachement. Il est utilisé par la méthode
    [`Doc::unattachAllTimers()`][docunattachalltimers].

(string) `execdate`
:   Date au format `YYYY-MM-DD HH:MM` ou `YYYY-MM-DD`. 
    Cette date sert de date de référence si 
    elle est non vide.
    
    Si cette date est vide, la date de référence est calculée en fonction de la
    date de référence indiquée sur le minuteur (attribut `tm_dyndate`). Si la
    date référence du minuteur est aussi vide, alors la date de référence est la
    date d'attachement.

## Valeur de retour  {#core-ref:fef13c43-305f-4dd3-a6ed-b17b5386bc86}

La valeur de retour est le message d'erreur. Un retour vide indique que
l'opération s'est bien déroulée.

## Erreurs / Exceptions  {#core-ref:e592abae-89bb-46d0-9cb8-b17b54e57363}

Les cas de retours d'erreurs sont :

*   Ce minuteur est déjà attaché
*   Le document "minuteur" n'est pas un minuteur
*   Le minuteur n'a déclaré aucune action


## Historique  {#core-ref:76c86762-5bb5-4be7-9dfa-c2fa4280d0cc}

Aucun.

## Exemples  {#core-ref:9529f1c5-b423-46d3-b361-a2eadc6d4c4d}

### Attacher un minuteur maintenant

Soit le minuteur n°13509 suivant :

|     Attribut    |       Label        |     Valeur     |
| --------------- | ------------------ | -------------- |
| tm_delay        | Délai en jours     | 1              |
| tm_hdelay       | Délai en heure     | 0              |
| tm_dyndate      | Date de référence  | null           |
| tm_refdaydelta  | Décalage en jours  | 0              |
| tm_refhourdelta | Décalage en heure  | 3              |
| tm_iteration    | Nombre d'itération | 1              |
| tm_tmail        | Courrier à envoyer | [null]         |
| tm_method       | Méthode à exécuter | [::myMethod()] |

qui décrit qu'il faut exécuter la méthode "myMethod" après une journée avec un
décalage de 3 heures.

Attachement du minuteur n°13509 : 

    [php]
    $myDocument=new_doc("", 1427);
    $myTimer=new_doc("", 13509);
    $err=$myDocument->attachTimer($myTimer);
    
    if (empty($err)) {
      print_r( $myDocument->getAttachedTimers());
    } else {
      print "$err\n";
    }


Résultat :

    Array
    (
        [0] => Array
            (
                [timerid] => 13509
                [level] => 0
                [originid] => 
                [docid] => 1427
                [title] => Éléonore
                [fromid] => 1059
                [attachdate] =>    2014-10-15 16:21:00
                [referencedate] => 2014-10-15 19:21:00
                [tododate] =>      2014-10-16 19:21:00
                [donedate] => 
                [actions] => a:3:{s:5:"state";s:0:"";s:5:"tmail";s:0:"";s:6:"method";s:12:"::myMethod()";}
                [result] => 
                [id] => 16
            )
    )

La date d'exécution est positionné à la date de l'attachement plus une journée
et 3 heures (`tm_delay` + `tm_refhourdelta`).

### Attachement avec une date donnée 

Attachement du minuteur n°13509 : 

    [php]
    $myDocument=new_doc("", 1427);
    $myTimer=new_doc("", 13509);
    $err=$myDocument->attachTimer($myTimer, null , "2014-12-25 12:00");
    
    if (empty($err)) {
      print_r( $myDocument->getAttachedTimers());
    } else {
      print "$err\n";
    }


Résultat :

    Array
    (
        [0] => Array
            (
                [timerid] => 13509
                [level] => 0
                [originid] => 
                [docid] => 1427
                [title] => Éléonore
                [fromid] => 1059
                [attachdate] =>    2014-10-15 16:18:00
                [referencedate] => 2014-12-25 15:00:00
                [tododate] =>      2014-12-26 15:00:00
                [donedate] => 
                [actions] => a:3:{s:5:"state";s:0:"";s:5:"tmail";s:0:"";s:6:"method";s:12:"::myMethod()";}
                [result] => 
                [id] => 14
            )
    )

La date d'exécution est positionnée à la date de référence indiquée plus une
journée et 3 heures (`tm_delay` + `tm_refhourdelta`).


## Notes  {#core-ref:7ff8f05a-7a39-4093-9ee7-af4be187a0af}

Une entrée, de niveau *notice*, est enregistrée dans l'historique pour indiquer
l'attachement du minuteur.

## Voir aussi  {#core-ref:ba15dd37-8bf2-4cf3-b9c1-e74360b8f98c}

*   [`Doc::unattachTimer()`][docunattachtimer],
*   [`Doc::getAttachedTimers()`][docgetattachedtimers]

<!-- links -->
[docstore]:         #core-ref:b8540d13-ece6-4e9e-9b72-6a56bca9da12
[docunattachtimer]: #core-ref:0449b66d-e5ba-4fb6-88b5-5c69a1a4c27b
[docgetattachedtimers]:   #core-ref:3868bb5d-4847-4877-85f7-13be92430fe8
[dyndate]:          #core-ref:386637d4-ab5b-4b3b-bf80-f2e6c226c555
[docattachtimer]:   #core-ref:d40860f3-d0ba-4cff-b2e8-76ddfa08c600
[docunattachalltimers]: #core-ref:92275bbd-f185-426d-90f5-d2595d76db19
[doctimer]:         #core-ref:3de1c186-e1ab-44a3-b3b1-536d2f9a7554
