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

elif [ "$1" = "--init" ]; then
    REPO_URL="https://github.com/Dzapan/LAB4.git"
    REPO_NAME="NBI-Lab4-Git"
    KATALOG_DOCELOWY="$PWD/$REPO_NAME"

    if [ -d "$KATALOG_DOCELOWY" ]; then
        echo "Katalog $KATALOG_DOCELOWY juz istnieje."
        exit 1
    fi

    git clone "$REPO_URL" "$KATALOG_DOCELOWY"

    if [ "$?" -ne 0 ]; then
        echo "Blad podczas klonowania repozytorium."
        exit 2
    fi

    chmod +x "$KATALOG_DOCELOWY/skrypt.sh"

    echo "export PATH=\"\$PATH:$KATALOG_DOCELOWY\"" >> "$HOME/.bashrc"
    export PATH="$PATH:$KATALOG_DOCELOWY"

    echo "Repozytorium zostalo sklonowane do:"
    echo "$KATALOG_DOCELOWY"
    echo "Katalog zostal dodany do PATH."
    echo "Uruchom: source ~/.bashrc"

else
    echo "Nieznana opcja. Uzyj --help lub -h."
fi