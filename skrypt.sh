#!/bin/bash

if [ "$1" = "--date" ]; then
    date

elif [ "$1" = "--logs" ]; then
    liczbaPlikow=${2:-100}

    for i in $(seq 1 "$liczbaPlikow")
    do
        nazwaPliku="log$i.txt"

        echo "Nazwa pliku: $nazwaPliku" > "$nazwaPliku"
        echo "Utworzony przez skrypt: $0" >> "$nazwaPliku"
        echo "Data utworzenia: $(date)" >> "$nazwaPliku"
    done

elif [ "$1" = "--help" ]; then
    echo "Dostepne opcje:"
    echo "--date          Wyswietla dzisiejsza date"
    echo "--logs          Tworzy 100 plikow log"
    echo "--logs LICZBA   Tworzy podana liczbe plikow log"

else
    echo "Nieznana opcja. Uzyj --help."
fi