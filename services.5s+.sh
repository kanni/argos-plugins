#!/usr/bin/env bash

SERVICES=(mysql apache2 docker)
BODY=()
TITLE=" "

for i in "${SERVICES[@]}"
do
	FIRST_LETTER="$(echo $i | head -c 1 | awk '{print toupper($0)}')"
    OUTPUT=$(service $i status | grep -A 0 'Active:')

    if [[ $OUTPUT == *"(running)"* ]]; then
        BODY+=("$i | iconName=emblem-default")
        TITLE+=" <span size='small' foreground='#26de81'> $FIRST_LETTER</span>"
    else
        BODY+=("$i | iconName=emblem-unreadable")
        TITLE+=" <span size='small' foreground='#fc5c65'> $FIRST_LETTER</span>"
    fi
    BODY+=("-- start | bash='sudo service $i start' iconName=utilities-terminal-symbolic")
    BODY+=("-- stop | bash='sudo service $i stop' iconName=utilities-terminal-symbolic")
done

echo $TITLE
echo "---"

for j in "${BODY[@]}"
do
    echo $j
done

