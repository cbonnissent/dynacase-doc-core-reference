# Layout::eSetBlockData()  {#core-ref:088e711c-ea91-45e7-841d-289ffc53c80b}

<div markdown="1" class="short-description">

La méthode `eSetBlockData()` permet de spécifier les valeurs des balises
contenues dans les blocs (e.g. `[BLOCK TAG]...[ENDBLOCK TAG]`) pour des
templates HTML ou XML.

</div>

## Description  {#core-ref:28f3effa-b6cc-4dfd-80f5-5419c5c294c9}

    [php]
    void eSetBlockData ( string $blockTag, array $data = NULL )

La différence entre cette méthode et la méthode [`setBlockData()`][setblockdata]
et qu'elle encode les valeurs lors de l'insertion. L'encodage est réalisée par
la  fonction PHP [`htmlspecialchars()`][htmlspecialchars].

Liste des caractères encodés :

| Caractère |  Encodage  |
| --------- | ---------- |
| "         | &amp;quot; |
| '         | &amp;039;  |
| &gt;      | &amp;gt;   |
| &lt;      | &amp;lt;   |

### Avertissements  {#core-ref:c5712d42-6e5e-475b-bef9-21253f1e36df}

Aucun.

## Liste des paramètres  {#core-ref:349bd2d4-6712-4ff1-a133-b6779e957431}

(string) `tag`
:   Le nom de la balise du bloc à affecter. Le nom de la balise est spécifié
    sans les crochets ouvrant (`[`) et fermant (`]`).

(array) `data`
:   La liste des couples (`TAG` => `valeur`) à affecter dans le bloc.

## Valeur de retour  {#core-ref:ac6d7eff-3f2d-4b21-ab40-7fa8202bbd0c}

Aucune.

## Erreurs / Exceptions  {#core-ref:a5ca2af5-994d-49e3-8ae9-e9ba29d84456}

Aucune.

## Historique  {#core-ref:f8530d00-2b2b-45ee-8511-97ec787c4138}

Aucun.

## Exemples  {#core-ref:bec0b1d8-2e3e-48b2-9f99-f7277dec0b9c}

- Exemple #1

Fichier de template `MOVIES/Layout/movies.xml` :

    [html]
    <ul>[BLOCK MOVIES]
      <li>
        <span class="movie_title">[MOVIE_TITLE]</span> 
        (<span class="movie_date">[MOVIE_DATE]</span>)
    </li>[ENDBLOCK MOVIES]</ul>


Contrôleur :

    [php]
    $layout = new Layout("MOVIES/Layout/movies.xml");
    $movies = array(
        array(
            'MOVIE_TITLE' => '"La guerre des étoiles": <Un nouvel espoir>',
            'MOVIE_DATE'  => '1977'
        ),
        array(
            'MOVIE_TITLE' => '"La guerre des étoiles": <L\'empire contre-attaque>',
            'MOVIE_DATE'  => '1980'
        ),
        array(
            'MOVIE_TITLE' => ('"La guerre des étoiles": <Le retour du Jedi>'),
            'MOVIE_DATE'  => '1983'
        )
    );
    
    $layout->eSetBlockData('MOVIES', $movies);
    print $layout->gen();

Résultat :

    [html]
    <ul>
      <li>
        <span class="movie_title">&quot;La guerre des étoiles&quot;: &lt;Un nouvel espoir&gt;</span> 
        (<span class="movie_date">1977</span>)
      </li>
      
      <li>
        <span class="movie_title">&quot;La guerre des étoiles&quot;: &lt;L&#039;empire contre-attaque&gt;</span> 
        (<span class="movie_date">1980</span>)
      </li>
      
      <li>
        <span class="movie_title">&quot;La guerre des étoiles&quot;: &lt;Le retour du Jedi&gt;</span> 
        (<span class="movie_date">1983</span>)
      </li>
    </ul>


## Notes  {#core-ref:567f5ef6-2a6d-4c53-a3a4-162c75ebdb9d}

Aucune.

## Voir aussi  {#core-ref:5f7c689c-dfc1-4ee7-8ea0-18dbfb471a72}

- Méthode [`Layout::setBlockData()`][setblockdata]

<!-- links -->
[set]: #core-ref:812c30ed-11cb-4b59-84d2-ba10e4ab7e88
[htmlspecialchars]: http://docs.php.net/manual/en/function.htmlspecialchars.php "Définition sur php.net"
[XSS]: http://fr.wikipedia.org/wiki/XSS "Définition sur wikipédia"
[setblockdata]: #core-ref:fb8a6d38-0bc7-469b-97d3-7cb8d6d3ea4b