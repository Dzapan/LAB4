#!/bin/bash

if [ "$1" = "--date" ]; then
    date

elif [ "$1" = "--logs" ]; then
	for i in $(seq 1 100)
	do
		nazwaPliku="log$i.txt"

		echo "Nazwa pliku: $nazwaPliku" > "$nazwaPliku"
		echo "Utworzony przez skrypt: $0" >> "$nazwaPliku"
		echo "Data utworzenia: $(date)" >> "$nazwaPliku"
	done
fi
