#!/bin/bash -

function usage() {
    echo "`basename $0` api-list output-dir [old-api-list]"
    exit 1
}

[ $# -lt 2 ] && usage

INPUT=$1
OUTPUT=$2
TEMPLATE=./template
YMLCONTENT="add-content.yml"
NLIST="generation-"+`date +'%Y-%m-%d-%T'`

function mkNewDir() {
    if [ ! -d "$1" ]; then
	[ "$DRY_RUN" == "no" ] && {
	    mkdir "$1"
	}
	echo "** [$1] new category => [$1]"
    else 
	echo "   [$1] update category"
    fi
} 
function mkNewFile () {
    if [ ! -f "$3" ]; then
	[ "$DRY_RUN" == "no" ] && {
	    if [ -f "$4" ]; then
		cat "$4" | sed -e "s/@CAT@/$1/g" -e "s/@FIL@/$2/g" > $3
	    else
		echo "# $1/$2" > "$3" 
		echo " " >> "$3"
		echo "...some content... " >> "$3"
		echo " " >> "$3"
	    fi
	}
	echo "**     [$1/$2] new entry => [$3] "
    else 
	echo "       [$1/$2] entry update"
    fi
} 

mkNewDir $OUTPUT
[ "$DRY_RUN" != "no" ] && {
    echo "**** "
    echo "****  Dry run mode activated, to build directories tree use DRY_RUN=no $0 ..."
    echo "**** "
}

touch  $NLIST 
echo "#  Build date : "`date` > $YMLCONTENT
ccat=""
for line in `cat $INPUT | sort `; do   
   cat=`echo "$line" | awk -F"::" '{ print $1 }'`
   fil=`echo "$line" | awk -F"::" '{ print $2 }'`
   [ "$fil" = "" ] && fil=$cat
   if [ ! -d $OUTPUT/"$cat" ]; then
       echo "        - level:   2" >> $YMLCONTENT
       echo "          element: \"api\"" >> $YMLCONTENT
       echo "          content:  \"$OUTPUT/$cat/introduction.md\"" >> $YMLCONTENT
       mkNewDir $OUTPUT/"$cat"
       mkNewFile "$cat" "introduction.md" $OUTPUT/"$cat""/introduction.md" 
       echo "(+) $cat/introduction.md" >> $NLIST
   fi 
   if [ ! -f $OUTPUT/"$cat"/"$fil.md" ]; then
       echo "        - level:   3" >> $YMLCONTENT
       echo "          element: \"api\""  >> $YMLCONTENT
       echo "          content: \"$OUTPUT/$cat/$fil.md\"" >> $YMLCONTENT
       mkNewFile "$cat" "$fil" $OUTPUT/"$cat"/"$fil"".md" $TEMPLATE
       echo "(+) $cat/$fil.md" >> $NLIST
   else
      echo "(=) $cat/$fil.md" >> $NLIST
   fi
done

[ $# -eq 3 ] && diff $3 $1 | grep '^<' | sed -e's,^< ,(-) ,' -e's,::,/,' >> $NLIST

echo " ***" 
echo " *** $YMLCONTENT contains added entries ***"
echo " ***" 


