#!/bin/bash

normalize() {
  echo "$1" | iconv -f utf8 -t ascii//TRANSLIT | tr " " "_"
}


path="$1"
short="$2"
long="$3"

[[ -z "$path" || -z "$short" || -z "$long" ]] \
  && echo "Usage: ./updateArticleName.sh ARTICLE_PATH SHORT LONG" >&2 \
  && exit 2

[[ ! -f "$path" ]] \
  && echo "Article '$path' does not exists" \
  && exit 1

# update short, long and id
sed -i '/author=/s/ short="[^"]\+"/ short="'"$short"'"/' "$path"
sed -i "/author=/s/>[^<]\+/>$long</" "$path"
newId="$(normalize "$short")"
sed -i '/author=/s/ id="[^"]\+"/ id="'"$newId"'"/' "$path"

articleDir="$(dirname "$path")"
oldId="$(basename "$path")"

# update other article links
sed -i 's/ href="'"$oldId"'"/ href="'"$newId"'"/' "$articleDir/*.html"

# move
mv "$path" "$articleDir/$id.html"

# commit
git add .
git commit -m "updateArticleName.sh autocommit"

