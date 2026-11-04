#!/bin/bash
# Usage : ./publier.sh chemin/vers/fichier.html nom-de-la-demo
set -e
[ $# -eq 2 ] || { echo "Usage : ./publier.sh fichier.html nom-de-la-demo"; exit 1; }
mkdir -p "$2"
cp "$1" "$2/index.html"
git add "$2"
git commit -m "Publication : $2"
git push
URL=$(git remote get-url origin | sed -E 's#.*github.com[:/]([^/]+)/([^/.]+)(\.git)?#https://\1.github.io/\2#')
echo "En ligne d'ici ~1 min : $URL/$2/"
