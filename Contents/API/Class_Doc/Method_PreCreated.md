# Doc::preCreated() {#core-ref:e85aa9d4-5e62-4a60-9d1c-f60433301747}

<div class="short-description" markdown="1">

[Hameçon][hook] (ou hook) utilisé par la méthode [`Doc::Store()`][docstore].
Elle est appelée avant l'enregistrement en base de données.   Cette méthode est
principalement utilisée pour vérifier si les conditions de création / révision
de document sont valides.

Cette méthode est utilisable aussi pour pré-remplir des attributs avant
l'enregistrement.

*Attention* :Cette méthode est aussi appelée lors de la révision d'un document.

</div>


## Description {#core-ref:4707d4b4-3cad-4d76-8d1d-d9fa75f2fe30}

    [php]
    string preCreated ()

Si cette méthode retourne un message d'erreur alors la création est abandonnée
et la méthode [`Doc::store()`][docstore] retourne le message fourni par cette
méthode afin d'indiquer l'échec.

### Avertissements {#core-ref:014358b2-bf94-4af3-af27-c5de57751a46}

Le document n'a pas encore d'identifiant lors de la création initiale. S'il
s'agit d'une révision, le document possède déjà un identifiant mais celui-ci
est modifié. L'identifiant initial (`initid`) reste inchangé en cas de
révision.
On peut donc reconnaître le cas de la révision de celui de la création initiale
en faisant :

    [php]
    namespace My;
    use \Dcp\AttributeIdentifiers\MyFamily as MyAttributes;
    
    class MyFamily extends \
    Dcp\Family\Document
    {
        public function preCreated()
        {
            if ($this->id) {
                //Creation
            } else {
                //Revision
            }
        }
    }

## Liste des paramètres {#core-ref:347f3a0c-8520-488c-a42f-10c682a2ea32}

Aucun paramètre.

## Valeur de retour {#core-ref:87b533dd-c54b-4235-8608-8d6c6acfc87a}

Message d'erreur. Si la méthode retourne une chaîne de caractères non vide, elle
est considérée comme un message d'erreur et la création de document est
abandonnée.

Ce message est aussi stocké dans le paramètre de sortie `$info->error` de la
méthode [`Doc::store()`][docstore].

## Erreurs / Exceptions {#core-ref:a60d52b1-2de0-4b17-9c30-b149fb8e0af6}

Aucune.

## Historique {#core-ref:19ffa317-5af2-4eed-9c87-d209403a9d8f}

Aucun.

## Exemples {#core-ref:3a95452a-c163-4c2b-8dc1-01794dc778cf}

Dans la famille _MyFamily_, la création d'un document ne doit être possible que
si la somme des attributs MY_NUMBERONE et MY_NUMBERTWO est inférieur au
paramètre MY_MAX de la famille.

Soit la famille suivante :

| BEGIN |                   |     Ma famille    |                |     | MYFAMILY |       |     |     |
| ----- | ----------------- | ----------------- | -------------- | --- | -------- | ----- | --- | --- |
| CLASS | My\MyFamily       |                   |                |     |          |       |     |     |
| //    | idattr            | idframe           | label          | T   | A        | type  | ord | vis |
| ATTR  | MY_IDENTIFICATION |                   | Identification | N   | N        | frame | 10  | W   |
| ATTR  | MY_NUMBERONE      | MY_IDENTIFICATION | nombre 1       | Y   | N        | int   | 20  | W   |
| ATTR  | MY_NUMBERTWO      | MY_IDENTIFICATION | nombre 2       | N   | N        | int   | 30  | W   |
| PARAM | MY_PARAMETERS     |                   | Paramètres     | N   | N        | frame | 10  | W   |
| PARAM | MY_MAX            | MY_PARAMETERS     | max            | N   | N        | int   | 20  | W   |
| END   |                   |                   |                |     |          |       |     |     |


    [php]
    namespace My;
    use \Dcp\AttributeIdentifiers\MyFamily as MyAttributes;
    
    class MyFamily extends \
    Dcp\Family\Document
    {
        public function preCreated()
        {
            $err = parent::preCreated();
            $n1 = $this->getAttributeValue(MyAttributes::my_numberone);
            $n2 = $this->getAttributeValue(MyAttributes::my_numbertwo);
            $max = $this->getFamilyParameterValue(MyAttributes::my_max);
            if (($n1 + $n2) > $max) {
                $err .= ($err ? "\n" : "") . sprintf("Max %d is reached", $max);
            }
            return $err;
        }
    }

## Notes {#core-ref:3548a3b2-cd44-412e-9ca5-ace8470fc3d1}

En cas de famille héritée, il est nécessaire d'appeler l'hameçon du parent pour
disposer des mêmes fonctionnalités.

Cette méthode est appelée par [`Doc::store()`][docstore] qu'en cas de création
ou de révision tandis que l'hameçon [`Doc::preStore()`][docprestore] est appelé
systématiquement par la méthode [`Doc::store()`][docstore].

## Voir aussi {#core-ref:e9e47c9a-ab49-4a64-bec8-0db3540456f0}

*   [Doc::store][docstore]
*   [Doc::postCreated][docpostcreated]
*   [Doc::preStore][docprestore]
*   [Doc::postStore][docpoststore]
*   [Doc::revise][docrevise]

<!-- links -->
[docstore]:         #core-ref:b8540d13-ece6-4e9e-9b72-6a56bca9da12
[docpostcreated]:   #core-ref:b8f80e6b-a374-4bf4-bc76-47290cd69c45 "Hameçon Doc::postCreated()"
[docpoststore]:     #core-ref:99520a31-0aef-4bc6-b20a-114737059d17 "Hameçon Doc::postStore()"
[docprestore]:      #core-ref:3517da95-82fe-4adb-8bc4-ef49ca55edb0 "Hameçon Doc::preStore()"
[docprecreated]:    #core-ref:e85aa9d4-5e62-4a60-9d1c-f60433301747 "Hameçon Doc::preCreated()"
[docprerefresh]:    #core-ref:580d6be1-6b6a-439b-abd7-34b26cfaf2e5 "Hameçon Doc::preRefresh()"
[docpostrefresh]:   #core-ref:9352c534-3691-41e3-b293-599db8e9a4fd "Hameçon Doc::postRefresh()"
[docrevise]:        #core-ref:882e3730-0483-4dbc-9b9d-0d0b5cc31d38
[hook]:             https://fr.wikipedia.org/wiki/Hook_(informatique)

