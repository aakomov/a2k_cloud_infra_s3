#!/bin/bash

PUBLIC_BUCKET="otus-mlops-source-data"
TARGET_BUCKET=$(yc storage bucket list --format json | jq -r '.[].name')

# Получаем список файлов из бакета
FILES=$(s3cmd ls s3://otus-mlops-source-data/ | awk '{print $4}')

# Счётчик скопированных файлов
COPIED_COUNT=0

# Копируем каждый из них
for FILE in $FILES; do
    FILE_NAME=$(basename "$FILE")
    echo "Copying: $FILE_NAME"
    
    s3cmd cp \
    --acl-public \
    s3://$PUBLIC_BUCKET/$FILE_NAME \
    s3://$TARGET_BUCKET/$FILE_NAME
    
    # Увеличиваем счётчик, если копирование успешно
    if [ $? -eq 0 ]; then
        ((COPIED_COUNT++))
    fi
done

echo "Copied $COPIED_COUNT files successfully."