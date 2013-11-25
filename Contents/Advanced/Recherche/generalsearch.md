# Recherche globale {#core-ref:19b9f4b4-c960-46eb-b4e0-805ed76be3a6}

La [classe `SearchDoc`][searchdoc] peut aussi être utilisée pour rechercher des
valeurs sur l'ensemble des attributs des documents. Pour cela il faut utiliser
la méthode [`::addGeneralFilter()`][addGeneralFilter]. Cette méthode prend en
argument un ou plusieurs mots. Ce filtre ne tient pas compte de la casse. Il
n'est pas possible de filtrer sur un mot en tenant compte de sa casse.

    [php]
    $s=new SearchDoc('',"ANIMAL");
    $s->addGeneralFilter('cheval'); 
    $s->search();

L'exemple ci-dessus permet de rechercher dans la famille "Animal" tous les
documents dont au moins une valeur contient le mot "cheval". Dans cet exemple
cela permet aussi de retrouver les documents contenant leur forme plurielle,
dans ce cas : "chevaux". Par contre cette recherche ne retournera pas les
documents contenant "chevaleresques". Cette recherche ne tient pas compte des
accents.

## Terme exact {#core-ref:91db46cf-99e1-411c-aab1-e62ab0752bce}

Pour rechercher un terme exact il faut le mettre entre `"` (double quotes). Ainsi

    [php]
    $s->addGeneralFilter('"cheval"'); 

retourne les documents contenant le mot "cheval" mais pas "chevaux", cette
recherche tient aussi compte des accents.

    [php]
    $s->addGeneralFilter('"cheval blanc"'); 

retourne tous les documents contenant exactement le terme cheval blanc
(attention, ici, blanc doit être positionné immédiatement à la suite de cheval).

## Partie de mot {#core-ref:226c599f-9816-44d6-857c-ba1cd5ef1852}

Pour rechercher une partie de mot, il faut utiliser le caractère `*` devant la
partie à rechercher.

    [php]
    $s->addGeneralFilter('cheva*'); 

retourne tous les documents contenant des mots commençant par cheva, comme
`cheval`, `chevalier`, `chevaux`, etc.

    [php]
    $s->addGeneralFilter('*vage');

retourne tous les documents contenant des mots se terminant par vage, comme
élevage, gavage, pavage, etc.

## Plusieurs mots {#core-ref:d2a146a2-a692-4750-9bab-e451a9e9664d}

Pour rechercher plusieurs mots il suffit de les indiquer en les séparant par un
espace ou le mot clef `AND` en majuscule.

    [php]
    $s->addGeneralFilter('cheval noir'); 
    $s->addGeneralFilter('cheval AND noir'); // forme équivalente avec AND

Cet exemple recherche tous les documents dont un attribut contient le mot
"cheval" et aussi le mot "noir" (sur le même attribut ou un autre). Attention le
filtre suivant

    [php]
    $s->addGeneralFilter('"cheval noir"');

recherche les documents contenant "cheval" suivi de "noir" 

La disjonction est aussi disponible en utilisant le mot clef `OR` en majuscule
entre deux mots

    [php]
    $s->addGeneralFilter('cheval OR poulain');

Différentes combinaisons peuvent ensuite être utilisées pour réaliser un filtre
plus complexe

    [php]
    $s->addGeneralFilter('(cheval noir) OR (jument blanche)');

Cet exemple recherche les chevaux noirs ou les juments blanches.

## Utilisation de l'option de correction d'orthographe {#core-ref:1451e444-7dad-4104-af22-540b49eb0c7b}

La méthode SearchDoc::addGeneralFilter() dispose d'une option (deuxième
paramètre) pour vérifier l'orthographe des mots en  français.

    [php]
    $s->addGeneralFilter('méson',true);

Cet exemple lance une recherche sur les mots "méson" ou "maison". Cette
vérification n'est pas effectuée sur les termes exacts (avec double quote) ni
sur les expressions (usage du `*` ). 

## Ordonnancement par pertinence {#core-ref:d3f2d069-4e87-4423-97cf-4589ae3be2c7}

Par défaut les documents retournés par SearchDoc sont triés par titre. Il est
possible de les trier par pertinence. 

Le calcul de la pertinence est effectué par PostgreSql. Elle prend en compte
l'information lexicale, la proximité et la structure ; en fait sont considérés

*   le nombre de fois où les termes de la requête apparaissent dans le
    document,
*   la proximité des termes de la recherche avec ceux de la requête,
*   l'importance du passage du document où se trouvent les termes du document.

Les poids des mots sont en fonction de l'endroit où le terme est trouvé.

*   poids A : titre du document,
*   poids B : attributs résumés,
*   poids C : autres attributs non résumé,
*   poids D : contenu des fichiers attachés (si indexation activé).

Si le terme recherché est de poids A, la pertinence sera plus élevée que s'il
est trouvé avec un poids B. Si on a utilisé une recherche générale sans
expression ni mot exact, on peut utiliser la méthode
[`::setPertinenceOrder()`][setPertinenceOrder] sans argument :

    [php]
    $s=new SearchDoc('',"ANIMAL");
    $s->addGeneralFilter('cheval'); 
    $s->setPertinenceOrder();
    $s->search();

Dans ce cas, les clefs d'ordonnancement sont celles du filtre. Le résultat est
trié par pertinence sur le mot "cheval" (ou "chevaux"). Si on utilise le mot
exact, la pertinence sera équivalente à la recherche par mot. On obtiendra le
même ordre  avec un calcul sur la forme lemmatisé de "cheval" (incluant
"chevaux").

    [php]
    $s->addGeneralFilter('"chevaux"'); 
    $s->setPertinenceOrder(); // la pertinence est sur le mot cheval

La pertinence sans argument ne peut pas être utilisée avec une recherche
d'expression. Si on veut maîtriser plus précisément la pertinence, il est
possible d'utiliser ses propres mots.

    [php]
    $s=new SearchDoc('',"ANIMAL");
    $s->addFilter("an_description ~ * 'Equus'"); 
    $s->setPertinenceOrder('cheval poulain jument');
    $s->search();

Dans ce cas, la recherche étant sur des attributs précis, il faut préciser
explicitement le critère de pertinence. Dans cet exemple, la pertinence se fera
sur les occurrences des mots "cheval", "poulain" ou "jument" trouvés dans les
documents retournés qui contiennent 'Equus' dans leur description.

## Mise en évidence des mots trouvés {#core-ref:c4634cc1-0729-49d0-af4c-96d517d2de67}

La méthode `SearchDoc::getHighlightText()` permet de retourner la partie où le
texte recherché a été rencontré. Cette fonctionnalité ne peut être utilisée
qu'avec une recherche de mots. Cela ne fonctionne pas avec les expressions ni
avec les mots exacts.

    [php]
    $s = new SearchDoc('', 'ANIMAL');
    $s->addGeneralFilter("cheval noir");
    $s->setObjectReturn(true);
    $s->search();
    $dl = $s->getDocumentList();
    foreach ($dl as $doc) {
      $ht = $dl->getSearchDocument()->getHighLightText($doc);
      printf("%d) %s : %s\n"),$doc->id, $doc->getTitle(), $ht);
    }

Les mots trouvés sont par défaut entourés des balises `<strong>` et
`</strong>;`. Elles peuvent être modifiées avec les arguments optionnels de
la méthode.

<!-- link -->
[searchdoc]:          #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255
[setPertinenceOrder]: #core-ref:287db32e-abb9-4ea3-a692-3dfded873b48
[addGeneralFilter]:   #core-ref:453cff11-09d9-4607-ab81-7acd36e99750