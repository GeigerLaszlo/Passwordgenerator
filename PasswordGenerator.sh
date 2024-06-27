#!/bin/bash

# Function to display help message
function display_help() {
    echo "Usage: $(basename "$0") [-n length]"
    echo "Generate a random password of specified length (default length is 12)"
    echo "Options:"
    echo "  -n length   Specify the length of the generated password"
    echo "  --help      Display this help message"
}

# Function to generate random string
function rand_string() {
    local length=$1
    local string=""
    local previous=""
    local current=""
    while [[ ${#string} -lt $length ]]; do
        current=$(LC_CTYPE=C tr -dc 'a-zA-Z0-9[:punct:]' < /dev/urandom | head -c 1)
        if [[ "$current" != "$previous" ]]; then
            string+="$current"
            previous=$current
        fi
    done
    echo "$string"
}

# Main program
if [[ "$1" == "--help" ]]; then
    display_help
elif [[ "$1" == "-n" && "$2" =~ ^[0-9]+$ ]]; then
    rand_string "$2"
else
    rand_string 12
fi

