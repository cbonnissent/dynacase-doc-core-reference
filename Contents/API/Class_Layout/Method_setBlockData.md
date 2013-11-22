# Layout::setBlockData() {#core-ref:fb8a6d38-0bc7-469b-97d3-7cb8d6d3ea4b}

<div markdown="1" class="short-description">

La méthode `setBlockData()` permet de spécifier les valeurs des balises
contenues dans les blocs (e.g. `[BLOCK TAG]...[ENDBLOCK TAG]`) du template.

</div>

## Description {#core-ref:b9c70046-2c16-46ca-8bdc-5fea8287ab61}

    [php]
    void setBlockData ( string $blockTag, array $data = NULL )

### Avertissements {#core-ref:b5aa63d1-e65a-4d4f-883a-c23b2aed719b}

Aucun.

## Liste des paramètres {#core-ref:b8de0258-9ed0-461e-adac-263ea02f3807}

(string) `tag`
:   Le nom de la balise du bloc à affecter. Le nom de la balise est spécifié
    sans les crochets ouvrant (`[`) et fermant (`]`).

(array) `data`
:   La liste des couples (`TAG` => `valeur`) à affecter dans le bloc.

## Valeur de retour {#core-ref:1007e36d-4502-459f-8205-52879547c173}

Aucune.

## Erreurs / Exceptions {#core-ref:58666d0a-afe6-4eda-92e9-bad43b6b01ae}

Aucune.

## Historique {#core-ref:2fba6b7f-3576-472f-b178-a3a349b8d779}

Aucun.

## Exemples {#core-ref:f3cde6c7-3c78-43f6-be52-d9717d16c455}

- Exemple #1

Fichier de template `MOVIES/Layout/movies.xml` :

    [html]
    <ul>
    [BLOCK MOVIES]
      <li>
        <span class="movie_title">[MOVIE_TITLE]</span> (<span class="movie_date">[MOVIE_DATE]</span>)
      </li>
    [ENDBLOCK MOVIES]
    </ul>

Contrôleur :

    [php]
    $layout = new Layout("MOVIES/Layout/movies.xml");
    
    $movies = array(
    	array(
    		'MOVIE_TITLE' => htmlspecialchars('Star Wars: A New Hope'),
    		'MOVIE_DATE'  => '1977'
    	),
    	array(
    		'MOVIE_TITLE' => htmlspecialchars('Star Wars: The Empire Strikes Back'),
    		'MOVIE_DATE'  => '1980'
    	),
    	array(
    		'MOVIE_TITLE' => htmlspecialchars('Star Wars: Return of the Jedi'),
    		'MOVIE_DATE'  => '1983'
    	)
    );
    
    print $layout->gen();

## Notes {#core-ref:3bcb3717-065c-4eb5-83fd-744310df77ea}

Pour se prémunir de toute attaque du type [XSS][XSS] (Cross-site scripting) il
vous faudra potentiellement échapper les valeurs en fonction du contexte dans
lesquelles elles seront utilisés.

Par exemple, pour un fragment (ou un document) HTML il vous faudra utiliser la
méthode [`eSetBlockData()`][esetblockdata] ou la fonction PHP
[`htmlspecialchars()`][htmlspecialchars] afin d'échapper les caractères qui
pourraient être utilisés pour injecter du code HTML (ou JavaScript) dans le
résultat du template.

## Voir aussi {#core-ref:494cb86d-e4bc-4035-a3c2-b15c6426be3d}

- Méthode [`Layout::set()`][set]

<!-- links -->
[set]: #core-ref:812c30ed-11cb-4b59-84d2-ba10e4ab7e88
[esetblockdata]: #core-ref:088e711c-ea91-45e7-841d-289ffc53c80b
[htmlspecialchars]: http://docs.php.net/manual/fr/function.htmlspecialchars.php "Définition sur php.net"
[XSS]: http://fr.wikipedia.org/wiki/XSS "Définition sur wikipédia"