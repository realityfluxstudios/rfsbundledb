#!/bin/bash

# change this to the full path to your json files
# i separated my JSON files by site so IndieGala files were under /indiegala/
# and Humblebundle files were under /humblebundle/
# if you use this same scheme, just changed the name of the site and execute the
# shell script.
FILES=/PATH/TO/HUMBLEBUNDLE/JSON/FILES
for f in `ls $FILES`
do
  echo "Processing $f file..."
  rake import_hb[$FILES/$f]
done

#rake clean_db