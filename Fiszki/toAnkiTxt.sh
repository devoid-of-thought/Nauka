#!/bin/bash


#Skrypt konwertujący pliki .txt z folderu źródłowego do formatu Anki, zapisując wynik w jednym pliku docelowym.

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_folder> <destination_file.txt>"
    echo "Example: $0 txt/ Odin_intermediate_html_and_css.txt"
    exit 1
fi

SOURCE_DIR="${1%/}"
DEST_FILE="${SOURCE_DIR}/$2"
MAIN_DECK="$(basename "$DEST_FILE" .txt)"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

echo -e "#separator:tab\n#html:false\n#deck column:1\n#tags column:4" > "$DEST_FILE"

for file in "$SOURCE_DIR"/*.txt; do
    [ -e "$file" ] || continue
    
    if [ "$file" = "$DEST_FILE" ]; then
        continue
    fi
    
    subdeck_name=$(basename "$file" .txt)
    
    while IFS=";" read -r card_front card_back tag; do
        if [ -n "$card_front" ]; then
            echo -e "${MAIN_DECK}::${subdeck_name}\t${card_front}\t${card_back}\t${tag}" >> "$DEST_FILE"
        fi
    done < "$file"
done 

if [ $? -eq 0 ]; then
    echo "Success! Files have been formatted."
else
    echo "An error occurred."
    exit 1
fi
