#!/bin/bash
chmod +x sync_folders.sh

# Тест для проверки работы скрипта, если не указаны папки. Скрипт должен вывести "Usage: ..."
echo "---ТЕСТ1. Если не указаны аргументы---"
echo ""

./sync_folders.sh
echo ""

# Тест для проверки работы скрипта, если указана несуществующая главная папка
echo "---ТЕСТ2. Если главная папка не существует---"
echo ""

./sync_folders.sh non_existent/ folder1
echo ""


# Тест для проверки работы скрипта, если указана несуществующая папка. Скрипт должен создать эту папку и провести синхронизацию
echo "---ТЕСТ3. Если указана несуществующая папка для синхронизации---"
echo ""

./sync_folders.sh testdir folder2
cd testdir
touch file1.txt file2.txt
cd ..

./sync_folders.sh testdir folder2
echo "Файлы в папке folder2:"
cd folder2
ls
cd ..
echo ""

# Тест для проверки работы скрипта, если указано больше 2 папок
echo "---ТЕСТ4. Если указано больше 2 папок---"
echo ""

echo "До создания файла file3.txt: "
./sync_folders.sh testdir folder2 folder3 folder4
echo "Файлы в папке testdir:"
cd testdir
ls
echo ""
echo "Создание файла file3.txt.."
touch file3.txt
cd ..
echo ""

echo "После создания файла file3.txt: "
./sync_folders.sh testdir folder2 folder3 folder4
cd folder4
echo "Файлы в folder4:"
ls

cd ..
rm -r folder2 folder3 folder4
cd testdir
rm file1.txt file2.txt file3.txt