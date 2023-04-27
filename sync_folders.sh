
if [ $# -lt 2 ]; then
  echo "Usage: $0 main_folder(files will be synchronized from here) folder2...folderN"
  exit 1
fi

if [[ ! -d "$1" ]]; then
  echo "Main folder doesn't exist.."
  echo "I can't synchronize files from non-existing folder."
  exit 1
fi

for folder in "${@}"; do
  if [ ! -d "$folder" ]; then
    echo "Folder $folder doesn't exist. Creating.."
    echo ""
    mkdir $folder

  fi
done

for i in "${@}"; do
  for j in "${@}"; do
    if [[ $i != $j ]]; then
      rsync -avh --delete "$i/" "$j/"
    fi
  done
done