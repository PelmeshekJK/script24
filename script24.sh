#!/bin/bash

if [[ $# != 6 ]]
then
    echo "НЕ ВСЕ АРГУМЕНТЫ ПЕРЕДАНЫ!"
    exit 1
fi

while [[ -n $1 ]]
do
case $1 in
    -i) if [[ -f $2 ]]
        then
            input_file=$2
        else
            echo "ФАЙЛА С ДАННЫМИ НЕ СУЩЕСТВУЕТ"
            exit 1
        fi ;;
    -o) output_file=$2 ;;
    -d) search_word=$2 ;;
    *) echo "ВВЕДЕН НЕИЗВЕСТНЫЙ КЛЮЧЕВОЙ АРГУМЕНТ: $1"
        exit 1 ;;
esac
shift
shift
done

if [[ ! -n $input_file || ! -n $output_file || ! -n $search_word ]]
    then
    echo "ОДИН ИЗ КЛЮЧЕВЫХ АРГУМЕНТОВ НЕ ПЕРЕДАН!"
    exit 1
fi

counter=0
for word in `cat $input_file`
do
    if [[ $search_word == $word ]]
    then
        counter=$(( $counter + 1 ))
    fi
done

echo "Скрипт завершен успешно! Результаты вычислений записаны в файл $output_file"
echo "$counter" >> $output_file