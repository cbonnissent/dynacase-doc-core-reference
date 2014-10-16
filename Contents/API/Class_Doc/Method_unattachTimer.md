# Doc::unAttachTimer()  {#core-ref:0449b66d-e5ba-4fb6-88b5-5c69a1a4c27b}

<div class="short-description" markdown="1">
Méthode utilisée pour détacher un minuteur du document
</div>

## Description  {#core-ref:fcc6370a-27fd-4a16-a854-f50e3d65a0ad}

    [php]
    string unAttachTimer ( Dcp\Family\TIMER $timer )

Cette méthode permet de détacher un minuteur précis du document.

### Avertissements  {#core-ref:6cf29c09-c220-42d4-bdc1-a69d9485c86e}

Aucuns.

## Liste des paramètres  {#core-ref:90202560-202a-4425-b8cf-ce7e83e4329b}

(Dcp\Family\Timer) `timer`
:   Document [*Minuteur*][doctimer] qui doit être détaché du document

## Valeur de retour  {#core-ref:f40efd54-e310-443f-9a8c-2278528284c3}

La valeur de retour est le message d'erreur. Un retour vide indique que
l'opération s'est bien déroulée.

Si le minuteur n'est pas présent, aucun message d'erreur n'est retourné.

## Erreurs / Exceptions  {#core-ref:f0d6afab-577f-410e-86f9-fedb7a347f52}

Les cas de retours d'erreurs sont :

*   Le document "minuteur" n'est pas un minuteur
*   Erreur d'accès interne à la base de donnée


## Historique  {#core-ref:9988ace8-9ae9-4524-a0e4-8efea3cfb637}

Aucun.

## Exemples  {#core-ref:04b6c192-7429-4762-b061-8eae1da6b1ca}

Détachement d'un minuteur :

    [php]
    $myDocument=new_doc("", 1427);
    $myTimer=new_doc("", 13510);
    print "Avant\n"
    print_r( $myDocument->getAttachedTimers());
    $err=$myDocument->unattachTimer($myTimer);
    
    print "Après\n"
    if (empty($err)) {
      print_r( $myDocument->getAttachedTimers());
    } else {
      print "$err\n";
    }


Résultat : 

Le minuteur n°13510 est présent à l'origine :

    Avant:
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
                    [attachdate] => 2014-10-15 17:24:00
                    [referencedate] => 2012-10-01 05:00:00
                    [tododate] => 2012-10-01 05:00:00
                    [donedate] => 
                    [actions] => a:3:{s:5:"state";s:0:"";s:5:"tmail";s:0:"";s:6:"method";s:12:"::myMethod()";}
                    [result] => 
                    [id] => 22
                )
        )

Le minuteur n'est plus enregistré

    Après:
        Array
        (
        )


## Notes  {#core-ref:2eb229c8-90d5-43ce-a308-97737ac64fee}

Une entrée, de niveau *notice*, est enregistrée dans l'historique pour indiquer
le détachement du minuteur.

## Voir aussi  {#core-ref:6809b8ac-eb2a-471d-9261-c1c6a2e493d6}

*   [`Doc::attachTimer()`][docattachtimer],
*   [`Doc::getAttachedTimers()`][docgetattachedtimers]

<!-- links -->
[docstore]:         #core-ref:b8540d13-ece6-4e9e-9b72-6a56bca9da12
[docunattachtimer]: #core-ref:0449b66d-e5ba-4fb6-88b5-5c69a1a4c27b
[docgetattachedtimers]:   #core-ref:3868bb5d-4847-4877-85f7-13be92430fe8
[dyndate]:          #core-ref:386637d4-ab5b-4b3b-bf80-f2e6c226c555
[docattachtimer]:   #core-ref:d40860f3-d0ba-4cff-b2e8-76ddfa08c600
[doctimer]:         #core-ref:3de1c186-e1ab-44a3-b3b1-536d2f9a7554