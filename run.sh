#!/bin/sh

# 引数があるかチェック
if [ -z "$1" ]; then
    echo "Usage: $0 filename.alg"
    exit 1
fi

# ファイル名から拡張子を除いた名前を取得
FILE_NAME=$(basename "$1" .alg)

echo "--- Translating ALGOL 60 to C ---"
marst "$1" -o "${FILE_NAME}.c"

if [ $? -eq 0 ]; then
    echo "--- Compiling C Code ---"
    gcc "${FILE_NAME}.c" -lalgol -lm -o "$FILE_NAME"

    if [ $? -eq 0 ]; then
        echo "--- Executing $FILE_NAME ---"
        echo "----------------------------"
        ./"$FILE_NAME"
        echo -e "\n----------------------------"
    else
        echo "Error: GCC compilation failed."
    fi
else
    echo "Error: MARST translation failed."
fi
