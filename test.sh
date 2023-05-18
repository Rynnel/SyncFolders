#!/bin/bash
chmod +x sync_folders.sh

# Тест для проверки работы скрипта, если не указаны папки. Скрипт должен вывести "Usage: ..."
echo "---ТЕСТ 1. Если не указаны аргументы---"
echo ""
echo "./sync_folders.sh" #Этот вывод нужен для того, чтобы в терминале было видно в какой момент запускается скрипт.
./sync_folders.sh
echo ""

# Тест для проверки работы скрипта, если указана несуществующая главная папка
echo "---ТЕСТ 2. Если главная папка не существует---"
echo ""
echo "./sync_folders.sh non_existent/ folder1"
./sync_folders.sh non_existent/ folder1
echo ""


# Тест для проверки работы скрипта, если указана несуществующая папка. Скрипт должен создать эту папку и провести синхронизацию
echo "---ТЕСТ 3. Если указана несуществующая папка для синхронизации---"
echo ""
echo "./sync_folders.sh testdir folder2"
./sync_folders.sh testdir folder2
cd testdir
echo "Создание файлов file1.txt и file2.txt"
touch file1.txt file2.txt
cd ..
echo "./sync_folders.sh testdir folder2"
./sync_folders.sh testdir folder2
echo "Файлы в папке folder2:"
cd folder2
ls
cd ..
echo ""

# Тест для проверки работы скрипта, если указано больше 2 папок
echo "---ТЕСТ 4. Если указано больше 2 папок---"
echo ""

echo "До создания файла file3.txt: "
echo "./sync_folders.sh testdir folder2 folder3 folder4"
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
echo "./sync_folders.sh testdir folder2 folder3 folder4"
./sync_folders.sh testdir folder2 folder3 folder4
cd folder4
echo "Файлы в folder4:"
ls

cd ..
rm -r folder2 folder3 folder4
cd testdir
rm file1.txt file2.txt file3.txt
