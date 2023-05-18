chmod +x HW_1.sh
./HW_1.sh > /dev/null

if [[ $? -eq 1 ]]
then
    echo "Тест №1 пройден!"
else
    echo "Тест №1 провален :("
    echo "Входные аргументы: ПУСТО"
    exit 1
fi
