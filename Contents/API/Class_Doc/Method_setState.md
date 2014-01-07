# Doc::setState() {#core-ref:c4b38315-9847-45c0-9e1d-b2ac92d4efc0}

<div class="short-description" markdown="1">

La méthode `setState` permet de changer l'état d'un document sur son [cycle de
vie][cycle_de_vie] associé.

</div>

## Description {#core-ref:87b4a6ae-b255-44f5-b1a2-df01efd24518}

    [php]
    string setState ( string $newstate,
                      string $comment     = '',
                        bool $force       = false,
                        bool $withcontrol = true,
                        bool $wm1         = true,
                        bool $wm2         = true,
                        bool $wneed       = true,
                        bool $wm0         = true,
                        bool $wm3         = true,
                    string & $msg         = '' )

La méthode `setState` permet de changer l'état du document si celui-ci est
associé à un [cycle de vie][cycle_de_vie].

### Avertissements {#core-ref:cb96551d-fd7e-492e-8378-ddc840f60d0a}

Aucun.

## Liste des paramètres {#core-ref:e19fa234-f246-4a78-b0b0-cb3a281fb300}

(string) `newstate`
:   `newstate` est le nom de l'état (de destination) dans lequel on souhaite
    mettre le document.

(string) `comment`
:   `comment` permet de spécifier un commentaire facultatif qui est inscrit dans
    l'historique du document suite à son changement d'état.
    
    Par défaut `comment` est une chaîne vide, et aucun message additionnel n'est
    inscrit dans l'historique du document.

(bool) `force`
:   `force` permet de forcer le changement d'état pour le cas ou l'état demandé
    n'est pas associé à une transition valide du [cycle de vie][cycle_de_vie].
    
    Par défaut `force` est à `false`, et le nouvel état demandé (de destination)
    doit alors avoir une transition valide avec l'état actuel (de départ) du
    document.

(bool) `withcontrol`
:   `withcontrol` permet de désactiver le contrôle des droits sur les transitions
    du cycle.
    
    Par défaut `withcontrol` est à `true`, et le contrôle des droits sur les
    transitions du cycle est appliqué.

(bool) `wm1`
:   `wm1` permet de spécifier si la méthode [`m1`][m1] de la transition doit
    être appliquée.
    
    Par défaut `wm1` est à `true`, et la méthode [`m1`][m1] de la transition est
    appliquée.

(bool) `wm2`
:   `wm2` permet de spécifier si la méthode [`m2`][m2] de la transition doit
    être appliquée.
    
    Par défaut `wm2` est à `true`, et la méthode [`m2`][m2] de la transition est
    appliquée.

(bool) `wneed`
:   `wneed` permet de spécifier si le contrôle des attributs obligatoire du
    document doit être appliqué.
    
    Par défaut `wneed` est à `true`,  et le contrôle des attributs obligatoire
    du document est appliqué.

(bool) `wm0`
:   `wm0` permet de spécifier si la méthode [`m0`][m0] de la transition doit
    être appliquée.
    
    Par défaut `wm0` est à `true`, et la méthode [`m0`][m0] de la transition est
    appliquée.

(bool) `wm3`
:   `wm3` permet de spécifier si la méthode [`m3`][m3] de la transition doit
    être appliquée.
    
    Par défaut `wm3` est à `true`, et la méthode [`m3`][m3] de la transition est
    appliquée.

[out] (string) `msg`
:   `msg` est une référence facultative à une chaîne de caractères qui est
    retournée par la méthode et qui contient les messages retournées par les
    méthodes `m1`, `m2` et l'émission des mails déclarés sur le cycle.

## Valeur de retour {#core-ref:06c7d6aa-0bad-4d38-a0db-4d95dbf5f077}

La méthode retourne une chaîne vide s'il n'y a pas d'erreurs, ou une chaîne
non-vide contenant un message d'erreur si la transition n'a pas pu être
réalisée.

## Erreurs / Exceptions {#core-ref:b574ece2-9cc4-4f0d-bc87-cb8dee17ee41}

La méthode retourne un message d'erreur si :

* L'état `newstate` demandé est vide ;
* Le document n'a pas de cycle de vie ;
* Le cycle de vie associé au document n'existe pas ;
* Le cycle de vie associé au document est corrompu (ex. syntaxe PHP invalide) ;
* L'état `newstate` de destination n'existe pas ou n'est pas associé à une
  transition valide et que `force` est à `false` ;
* L'état `newstate` de destination n'existe pas ou n'est pas associé à une
  transition valide et que l'utilisateur n'est pas le super-utilisateur `admin` ;
* `wm0` est à `true` et la méthode [`m0`][m0] n'existe pas ;
* `wm0` est à `true` et l'exécution de la méthode [`m0`][m0] à retournée un
  message d'erreur ;
* `wm1` est à `true` et la méthode [`m1`][m1] n'existe pas ;
* `wm1` est à `true` et l'exécution de la méthode [`m1`][m1] à retournée un
  message d'erreur ;
* `wneed` est à `true` et le contrôle des attributs obligatoire à retourné un
  message d'erreur (ex. des attributs obligatoires ne sont pas remplis) ;
* La revision ou l'inscription du document en base de données ont retourné un
  message d'erreur ;
* `wm2` est à `true` et la méthode [`m2`][m2] n'existe pas ;
* `wm3` est à `true` et la méthode [`m3`][m3] n'existe pas ;
* Le changement d'affectation du document déclaré sur le cycle à retourné un
  message d'erreur.

## Historique {#core-ref:2527664e-085e-4115-905d-5d891a268120}

Aucun.

## Exemples {#core-ref:ef6612f2-575c-4a0b-9cdd-faaa132a2a26}

- Exemple #1

    [php]
    /*
     * Mettre la facture dans l'état Archivé
     */
    $err = $facture->setState('ST_ARCHIVED');
    if ($err != '') {
        throw new Exception(
            sprintf("La facture n'a pu être archivée: %s", $err)
        );
    }

## Notes {#core-ref:70f2e1fe-dcd3-4498-9922-ad07f2c8766d}

Pour qu'il y ait changement d'état, il faut que l'état `newstate` de destination
demandé ait une transition valide depuis l'état de départ actuel du document.

S'il n'y a pas de transitons entre l'état de départ actuel du document et le
nouvel état `newstate` demandé, alors une erreur est remontée.

Dans ce cas, si vous voulez quand même mettre le document dans l'état
`newstate`, alors il faut utiliser le paramètre `force` avec la valeur `true`.

## Voir aussi {#core-ref:53aa2f83-128c-4253-8969-030b41180d99}

- [Famille de cycle de vie][family_wf]
- [Implémentation d'un cycle de vie][impl_wf]

<!-- links -->
[cycle_de_vie]: #core-ref:932119d9-2681-427f-bcf2-2c439784d051
[wf_cycle]: #core-ref:d5ddda0c-09d2-42b0-9543-0723e242ec09
[family_wf]: #core-ref:b8824399-f17d-4007-adde-8a7433939273
[impl_wf]: #core-ref:91e2017b-d595-47b3-bfc6-3b57c932b989
[m0]: #core-ref:c3bcdf20-5756-4880-b067-36f0d62b68c5
[m1]: #core-ref:603b0905-6269-4dca-a656-55e1d5524c3a
[m2]: #core-ref:ced2bc66-792e-4c55-bd0a-dcca09e9732d
[m3]: #core-ref:39462cd9-7962-4efe-888b-912d7256671a
