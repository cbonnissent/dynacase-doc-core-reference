# Action::Set

<div class=”short-description”>
Instancie l'objet à partir d'une action déclarée.
</div>

<div class=”applicabilite”>
Applicable
</div>

## Description

    [php]
    void set(string $name, Application &$parent)

Cette méthode permet d'initialiser l'objet afin de pouvoir utiliser l'action. Cette méthode est utilisée par le programme principal afin d'initialiser l'action demandée.

L'action à instancier doit indiquer l'application dont elle est issue.

### Avertissements

N/A

## Liste des paramêtres

(string) `name`
: Nom de l'action à instancier. Si le nom est vide, alors ce sera l'action principale (notée "*root*"=Y ) qui sera utilisée.

(Application) `parent`
: L'objet *Application* déjà instancié dont est issu l'action. Ce paramètre est obligatoire.

## Valeur de retour

Aucun retour

## Erreurs / Exceptions

Si l'action n'existe pas dans l'application indiquée, une exception `\Dcp\Core\Exception` avec le code *CORE0005* est envoyé. De plus, dans ce cas, un header HTTP *503 Action unavalaible* est envoyé.

## Historique

N/A
## Exemples

Exemple complet d'une initialisation d'action. L'application de l'action utilise l'application "*CORE*" comme parent.

    [php]
    $core = new Application();
    // initialisation de l'application CORE
    $core->Set("CORE", $CoreNull=null);
    // initialisation de la session utilisateur
    $core->session = new Session();
    $core->session->set();
    $one = new Application();
    // initialisation de l'application ONEFAM en utilisant CORE en partageant la session
    $one->set("ONEFAM", $core, $core->session);
    $myAct=new Action();
    // initialisation de l'action ONEFAM_LIST en utilisant l'application ONEFAM
    $myAct->set("ONEFAM_LIST", $one);
    print $myAct->execute();

## Notes

L'application mis en paramètre doit avoir une session car celle-ci est partagée avec l'objet "Action". S'il n'y a pas de session, les méthodes Action::read(), Action::register() et Action::unRegister() ne seront pas fonctionnelles.

L'action donnée en paramètre dans les fonctions de contrôle d'actions est déjà initialisée.

## Voir aussi
 
Voir Application::set()
