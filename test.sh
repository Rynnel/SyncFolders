#!/bin/bash
chmod +x sync_folders.sh


# Тест для проверки работы скрипта, если не указаны папки.
echo "---ТЕСТ 1. Если не указаны аргументы---"
echo ""
./sync_folders.sh
if [[ ! -n $1 ]]; then
    echo "Тест пройден!"
else
    echo "Тест провален."
    exit 1
fi
echo ""

# Тест для проверки работы скрипта, если указана несуществующая главная папка
echo "---ТЕСТ 2. Если главная папка не существует---"
echo ""
./sync_folders.sh non_existent folder1
if [[ ! -d $1 ]]; then
    echo "Тест пройден!"
else
    echo "Тест провален."
    exit 1
fi
echo ""

# Тест для проверки работы скрипта, если указана несуществующая папка. Скрипт должен создать эту папку и провести синхронизацию
echo "---ТЕСТ 3. Если указано несколько папок для синхронизации---"
echo ""
echo "./sync_folders.sh testdir folder2"
./sync_folders.sh testdir folder2
cd testdir
echo "Создание файлов file1.txt и file2.txt"
touch file1.txt file2.txt
cd ..
echo "./sync_folders.sh testdir folder2"
./sync_folders.sh testdir folder2


code=$(diff -q testdir folder2)
if [[ $code -eq 0 ]]; then
    echo "Тест пройден!"
else
    echo "Тест провален."
    exit 1
fi
echo ""

rm -r folder2
cd testdir
rm file1.txt file2.txt