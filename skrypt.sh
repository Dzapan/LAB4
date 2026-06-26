#!/bin/bash

if [ "$1" = "--date" ] || [ "$1" = "-d" ]; then
    date

elif [ "$1" = "--logs" ] || [ "$1" = "-l" ]; then
    liczbaPlikow=${2:-100}

    for i in $(seq 1 "$liczbaPlikow")
    do
        nazwaPliku="log$i.txt"

        echo "Nazwa pliku: $nazwaPliku" > "$nazwaPliku"
        echo "Utworzony przez skrypt: $0" >> "$nazwaPliku"
        echo "Data utworzenia: $(date)" >> "$nazwaPliku"
    done

elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Dostepne opcje:"
    echo "--date, -d          Wyswietla dzisiejsza date"
    echo "--logs, -l          Tworzy 100 plikow log"
    echo "--logs LICZBA        Tworzy podana liczbe plikow log"

else
    echo "Nieznana opcja. Uzyj --help lub -h."
fi