export MSISDN="${MSISDN:-"491720410129"}"
for file in features/templates/*.tpl
do
	basename=$(basename "$file")
	name="${basename%.*}"
	sed 's/<MSISDN>/'"$MSISDN"'/g' $file >features/$name.feature
done
