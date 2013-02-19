export Picturename="${Picturename:-"Buddha8.jpeg"}"
for file in features/templates/*.tpl
do
	basename=$(basename "$file")
	name="${basename%.*}"
	sed 's/<Picturename>/'"$Picturename"'/g' $file >features/$name.feature
done
