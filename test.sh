#!/bin/bash

# Функция для создания файла определенного размера
create_file() {
  local directory=$1
  local size=$2
  local count=$3
  local prefix=$4

  for i in $(seq 1 $count); do
    local filename="${directory}/${prefix}_${i}.bin"
    # Используем команду dd для создания файла нужного размера
    dd if=/dev/zero of="$filename" bs=10M count="$size" status=none
    echo "Создан файл: $filename размером ${size}MB"
  done
}

# Проверка и создание папки /tmp, если она не существует
[ -d "/tmp" ] || mkdir -p "/tmp"

# Проверка и создание папки /run, если она не существует
[ -d "/run" ] || mkdir -p "/run"

# Генерация 10 файлов по 100MB в /tmp
create_file "/tmp" 100 10 "file_100mb"

# Генерация 5 файлов по 200MB в /run
create_file "/run" 200 5 "file_200mb"

# Генерация 5 файлов по 10MB в /run
create_file "/run" 100 5 "file_10mb"

