# SearchDoc::addGeneralFilter() {#core-ref:453cff11-09d9-4607-ab81-7acd36e99750}

<div class="short-description">
Cette fonction permet de faire une <a href="https://en.wikipedia.org/wiki/Full_text" title="Wikipedia : full text search">recherche full text</a> sur un document.
</div>

## Description {#core-ref:9a461deb-2fa3-4c02-939b-c1d5425e77c1}

    [php]
    void addGeneralFilter ( string $filter, boolean $useSpell )

### Avertissements {#core-ref:b951b810-4d27-433c-8fee-6a9d7f99dee3}

Cette recherche ne fonctionne que en langue française.

## Liste des paramètres {#core-ref:f45c00e1-0b07-442f-b321-f8e7b34b85ea}

(string) `filter`
:   Cette chaîne de caractères contient le filtre dans le format de la 
    [recherche globale][globalSearch].

(boolean) `useSpell`
:   Indique si une correction orthographique sur les mots de la langue française
    doit être appliquée avant la recherche.

## Valeur de retour {#core-ref:5b4d4af5-b668-4d20-861e-cf749e520e58}

void

## Erreurs / Exceptions {#core-ref:68594dbd-ad1d-4e86-bfb3-071bf82d5c09}

Si le filtre indiqué est invalide (le test ne porte que sur le parenthèses) 
alors une erreur est enregistrée et le filtre n'est pas appliqué.

## Historique {#core-ref:74230984-e371-4766-8b0e-15152448f1db}

N/A

## Exemples {#core-ref:33fa9341-47a0-400d-8664-698efdf9aadf}

Voir la [recherche globale][globalSearch].

## Notes {#core-ref:bad0fd72-37c8-4bf9-9b57-a8716ed6b434}

N/A

## Voir aussi {#core-ref:94b287b2-3cc0-4d9d-8102-280a94aeb64f}

N/A

[globalSearch]:     #core-ref:19b9f4b4-c960-46eb-b4e0-805ed76be3a6
