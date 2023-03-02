#!/bin/bash

# script settings
OPENAI_MODEL="gpt-3.5-turbo"
OPENAI_API_TOKEN="sk-zWHHjthO...LudGVG"
PROMPT_PREFIX="What is wrong with this command: "
PROMPT_POSTFIX=" ? I ran it in Linux terminal and it gave me an error. \
Please give a concise answer (ideally, 3-4 sentences)."

# get the last execuded command
LAST_COMMAND=$1

echo "Sending this to OpenAI: \"$LAST_COMMAND\"..."

# get suggestions from OpenAI
OPENAI_RESPONSE=$(
    curl -s https://api.openai.com/v1/chat/completions \
        -H 'Content-Type: application/json' \
        -H 'Authorization: Bearer '"$OPENAI_API_TOKEN"'' \
        -d '{
            "model": "'"$OPENAI_MODEL"'",
            "messages": [
                {
                    "role": "user",
                    "content": "'"$PROMPT_PREFIX"''"$LAST_COMMAND"''"$PROMPT_POSTFIX"'"
                }
            ]
        }'
)

# get the first suggestion from the response
SUGGESTION=$(echo $OPENAI_RESPONSE | jq -r '.choices[0].message.content')

echo $SUGGESTION
