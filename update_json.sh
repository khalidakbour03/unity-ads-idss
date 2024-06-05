#!/bin/bash

# List of game IDs
GAME_IDS=("game_id_1" "game_id_2" "game_id_3" "game_id_4" "game_id_5" "game_id_6" "game_id_7" "game_id_8" "game_id_9" "game_id_10")

# Get the current index from a temporary file (initialize to -1 if it doesn't exist)
INDEX_FILE="current_index.txt"
if [ ! -f "$INDEX_FILE" ]; then
    echo -1 > "$INDEX_FILE"
fi

CURRENT_INDEX=$(cat $INDEX_FILE)
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#GAME_IDS[@]} ))

# Update the JSON file with the next game ID
cat <<EOT > game_ids.json
{
    "game_ids": ["${GAME_IDS[$NEXT_INDEX]}"]
}
EOT

# Save the next index to the file
echo $NEXT_INDEX > "$INDEX_FILE"
