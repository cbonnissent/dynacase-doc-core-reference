# Zones spécifiques d'administration {#core-ref:29d73638-3265-4dd2-8211-1745775b97d4}

Cet ensemble de zones est dédié à l'éditions de paramètres qu'ils soient 
[applicatif][param_app] ou de [familles][param_fam].

En utilisant ces zones, vous pourrez créer des interfaces d'édition de paramètres.

## `[ZONE FDL:EDITFAMILYPARAMETER]` {#core-ref:1fe59688-8e2c-4f02-8f02-806a5c51e114}

### Description {#core-ref:11a29900-3b74-4fa6-9860-8a9a54fc9d4f}

Cette zone permet d'afficher un paramètre en édition quelque soit son type. La
zone est encapsulée dans un élément HTML de type DIV, portant la classe
`editfamilyparameter` et possédant l'attribut `data-parameter` qui a pour
valeur l'identifiant du paramètre qui est affiché/modifié. Ce champ a pour
attribut `id` l'identifiant du paramètre à modifier, et comme attribut `name`
le même identifiant précédé d'un `_` (underscrore).

### Paramètres {#core-ref:b7add1e3-9244-4887-b3a8-07afdbcc7f84}

famid
:   Nom logique de la famille dont vous souhaitez éditer le paramètre.

attrid
:   Identifiant du paramètre à modifier

emptyValue
:   Valeur par défaut du formulaire. Si le paramètre n'a pas de valeur, l'interface
    est initiée avec cette valeur.

value
:   Valeur du formulaire. Quelque soit la valeur du paramètre, l'interface est 
    initiée avec cette valeur.

submitOnChange
:   `yes` ou `no`. Valeur par défaut `no`. Si la valeur est passée à `yes`, le 
    changement de valeur est transmis au serveur au `onChange` et au `onBlur`.

localSubmit
:   `yes` ou `no`. Valeur par défaut `yes`. Si la valeur est à `yes` un bouton 
    de soumission est ajouté à côté du champ de saisie.

submitLabel
:   Texte. Si cet élément est spécifié et que localSubmit est à `yes` alors
    le bouton de soumission a comme libellé cette valeur.

### Limites {#core-ref:4633de4c-8f31-4c73-a9b3-c62f803eacdc}

N/A

### Exemple {#core-ref:6048b623-5b79-41e2-ace6-00de70a440e5}

Définition de la zone : `[ZONE FDL:EDITFAMILYPARAMETER?famid=ZOO_ENTREE&attrid=ENT_PRIXENFANT&localSubmit=yes&submitOnChange=no]`

![ Modification de paramètre de famille ](images/zones_actions/zone_family_edit.png)

## `[ZONE FDL:EDITAPPLICATIONPARAMETER]` {#core-ref:ca0b714a-c660-4530-9822-b6f2cf6ec4a2}

### Description {#core-ref:a04a7311-3adf-4767-b618-7b05023af19f}

Cette zone est utilisée pour modifier les paramètres d'une application. En
l'ajoutant vous pourrez modifier tout paramètre d'application, quel que soit
son type. Elle crée un champ input de type texte ou de type select, suivant le
type du paramètre à modifier. Ce champ a pour attribut `id` l'identifiant du
paramètre à modifier, et comme attribut `name` le même identifiant précédé
d'un `_` (underscore).

### Paramètres {#core-ref:f7d62501-a051-4380-b713-2cc55377fab5}

appId
:   Nom logique de l'application contenant le paramètre

parameterId
:   Identifiant du paramètre de l'application

emptyValue
:   Valeur par défaut du formulaire. Si le paramètre n'a pas de valeur, l'interface
    est initiée avec cette valeur.

value
:   Valeur du formulaire. Quelque soit la valeur du paramètre, l'interface est 
    initiée avec cette valeur.

submitOnChange
:   `yes` ou `no`. Valeur par défaut `no`. Si la valeur est passée à `yes`, le 
    changement de valeur est transmis au serveur au `onChange` et au `onBlur`.

localSubmit
:   `yes` ou `no`. Valeur par défaut `yes`. Si la valeur est à `yes` un bouton 
    de soumission est ajouté à côté du champ saisie.

submitLabel
:   Texte. Si cet élément est spécifié et que localSubmit est à `yes` alors
    le bouton de soumission a comme libellé cette valeur.

### Limites {#core-ref:13abb2b7-7c69-48bb-be93-25cf00e45afd}

N/A

### Exemple {#core-ref:c8b4de59-48fa-4c37-bffa-749e7815734a}

Définition de la zone : `ZONE FDL:EDITAPPLICATIONPARAMETER?appId=ZOO&parameterId=ONEFAM_DISPLAYMODE&localSubmit=yes&submitOnChange=no`

![ Modification de paramètre de famille ](images/zones_actions/zone_application_edit.png)

## `[ZONE FDL:EDITSUBMIT]` {#core-ref:da121969-6030-47a2-8b8b-1a3c0d1d112c}

### Description {#core-ref:1ff3eab4-7e5a-4aab-a0eb-2c0696ed8913}

Cette zone est utilisée pour faire la sauvegarde de l'ensemble des Zones portant
la classe `editfamilyparameter`, ou `editapplicationparameter`, n'ayant pas de
bouton de validation, ni de validation lors de l'activation de l'événement
onchange (submitOnChange=no et localSubmit=no).

Elle crée un bouton qui envoie au serveur les informations des formulaires.
Tout formulaire contenu dans une DIV portant la classe `editfamilyparameter`
ou `editapplicationparameter`, n'ayant pas de système de validation (bouton,
input de type submit, envoi lors du onchange...) est envoyé lorsque ce bouton
est cliqué.

Comme les autres Zones de paramétrage, celle ci est encapsulée dans un élément
HTML de type DIV, portant la classe `editsubmit`. Cet élément ne contient
qu'un input de type `submit`.

### Paramètres {#core-ref:ae387137-7731-46c9-8267-0917fcc583d7}

label
:    Texte. L'attribut label définit le label du bouton (par défaut "Valider").

### Limites {#core-ref:b8973aa3-124d-48a2-80af-b91ef523458e}

N/A

<!-- link -->

[param_app]:        #core-ref:1c9a8c60-f102-4ff3-951b-a6faefcaf99f
[param_fam]:        #core-ref:4595c8e7-5002-4dbc-b6bb-882b4123efd8