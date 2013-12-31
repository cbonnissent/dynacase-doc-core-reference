# Doc::getFamilyParameterValue() {#core-ref:fdec5f7b-2f14-45b4-bf23-ca93af0754a3}

<div class="short-description" markdown="1">

La méthode `getFamilyParameterValue` permet d'obtenir la valeur des
[paramètres de famille][family_parameters].

</div>

## Description {#core-ref:6c10d57f-e07e-411d-855e-29c329279562}

    [php]
    string getFamilyParameterValue ( string $idp,
    	                             string $def = "" )

La méthode `getFamilyParameterValue` permet d'obtenir la valeur des
[paramètres][family_parameters] définis sur la famille du document courant.

### Avertissements {#core-ref:cd1dc4da-86fe-4917-86eb-52fdc2ee4032}

Aucun.

## Liste des paramètres {#core-ref:1f503124-dfdf-4a42-81a5-3655d3aaf8b0}

(string) `idp`
:   Le nom du paramètre dont on souhaite obtenir la valeur.

(string) `def`
:   `def` permet de spécifier la valeur par défaut retournée par la méthode
    si le nom du paramètre `idp` n'existe pas.
    
    Par défaut, la valeur par défaut est une chaîne vide.

## Valeur de retour {#core-ref:7cffbb46-353a-4072-9bca-1773599857dc}

La méthode retourne la valeur du paramètre demandé, ou la valeur par défaut
`def` si le paramètre demandé n'existe pas.

## Erreurs / Exceptions {#core-ref:8f7e827a-e0ec-4201-8144-1dd97a177222}

Si l'attribut demandé n'existe pas, la valeur par défaut `def` est retournée.

## Historique {#core-ref:6bb63026-94a9-4d6f-885a-c6a441513268}

### Release 3.2.5 {#core-ref:45cdc9a0-1207-441a-9a6b-69ec7b463a23}

La méthode `getFamilyParameterValue` remplace la méthode précédemment nommée
`getParamValue`.

L'utilisation de `getParamValue` est obsolète depuis la version 3.2.5 de
dynacase-core.

## Exemples {#core-ref:f88b2588-5973-4dd4-b4d9-cdcbee32bbb4}

- Exemple #1

La famille `Facture` comporte un paramètre qui permet de spécifier la valeur du
taux de TVA :

    [php]
    /*
     * Lire le taux de TVA défini sur le paramètre TAUX_TVA de la famille
     * du document `$facture`.
     */
    $tva = $facture->getFamilyParameterValue('TAUX_TVA', 0);
    if ($tva <= 0) {
    	throw new Exception(sprintf("Le taux de TVA doit être > 0 !"));
    }

## Notes {#core-ref:178ec882-01a8-4f47-8604-1540c01c9297}

Aucune.

## Voir aussi {#core-ref:84279092-92f3-4d03-8106-610fbb5259aa}

<!-- links -->
[family_parameters]: #core-ref:4595c8e7-5002-4dbc-b6bb-882b4123efd8
