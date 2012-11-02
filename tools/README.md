# generation de la liste des fonctions @api

  * renommer liste-api en liste-api.previous
  * sur la doc Doxygen généré (centre de documentation)

     # sur la doc doxygen générée
     grep '<dt><a class="anchor" id="_api' api.html | sed -e 's,^<.*><.*>\(.*\)</a>.*$,\1,' > /tmp/api

  * récupérer le fichier en local > *liste-api*
  
  * lancer dans le répertoire Contents
  
     DRY_RUN="no" ./make-api.sh liste-api API liste-api.previous
	 
Ca n'écrase pas les fichiers existants, initie les nouveaux et génère :

  * add-content.yml : à insérer dans le content.yml (tdm de l'api complète)
  * un fichier generation-(la date) contenant la liste des entrées (fichiers) annotée (=) existe (+) nouvelle (-) supprimée (!!)
  
  
  
