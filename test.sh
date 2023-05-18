chmod +x sync_folders.sh
./sync_folders.sh > /dev/null

if [[ $? -eq 1 ]]
then
    echo "Тест №1 пройден!"
else
    echo "Тест №1 провален :("
    echo "Входные аргументы: ПУСТО"
    exit 1
fi
