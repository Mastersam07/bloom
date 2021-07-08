#!/bin/bash
  

cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1

find lib/ -name *.dart -print0 | while read -d $'\0' file
do
        name="$(basename ${file})"
        grep -rn -F -q "${name}" /home/runner/work/bloom/bloom/lib/
        if [ $? -ne 0 ]
        then
                echo "Unused file: ${file}"
        fi
done
