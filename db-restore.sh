#!/bin/bash

if [ "$1" ]; then
  # Restore database
  ARCHIVEPATH=$1
  gunzip -k $ARCHIVEPATH
  FILEPATH="${ARCHIVEPATH%.gz}"
  PGPASSWORD=password psql -U postgres -h localhost -d subtuner -1 -f $FILEPATH
else
  echo "Please provide an archive as a parameter"
  exit
fi
