#!/bin/sh

TMP_FILE="$(pwd)/tmp_id3.sh"
AUDIO_FORMAT=".mp4"

# make sure the files are in the right format
BAD_FILE_FORMATS=$(ls | grep ".* - .* - .* - ") 
if [ -n "$BAD_FILE_FORMATS" ];
then
	echo -e "MANUAL ACTION REQUIRED: Fix the following file formats:\n"
	echo "$BAD_FILE_FORMATS"
	echo -e "\nNo changes were made to file ID3 tags."
	exit 0
fi

# create executable
ls -1 | grep $AUDIO_FORMAT | awk -F ' - ' '{print "id3tool -r \""$1"\" -a \""$2"\" -t \""$3"\" `"$0"`"}' > $TMP_FILE

# modify data
sed -ie 's/.mp4"/"/g' $TMP_FILE
sed -ie 's/`/"/g' $TMP_FILE

# execute
chmod +x $TMP_FILE
bash $TMP_FILE

# cleanup
rm $TMP_FILE
rm ${TMP_FILE}e
