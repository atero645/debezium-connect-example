#!/bin/bash

# Ścieżka do katalogu z plikami JSON
CONNECTORS_DIR="./topics"

# URL, do którego mają być wysyłane zapytania
URL="localhost:8083/connectors/"

# Przejdź po każdym pliku JSON w katalogu
for FILE in "$CONNECTORS_DIR"/*.json; do
  # Sprawdź, czy plik istnieje (jeśli katalog jest pusty, nie wykonuj)
  if [ -f "$FILE" ]; then
    # Wykonaj zapytanie curl z zawartością pliku jako payload
    echo -e "Rejestruje connector: $FILE"
    curl -X POST -H "Content-Type: application/json" -d @"$FILE" "$URL"
    echo -e "\n"
  else
    echo "Brak plików JSON w katalogu: $CONNECTORS_DIR"
  fi
done