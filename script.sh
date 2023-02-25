#!/bin/bash

# Prompt the user for a URL
read -p "Enter a URL to extract files from robots.txt: " url

# Download the robots.txt file
wget -q "$url/robots.txt" -O robots.txt

# Extract the URLs of important files from robots.txt
urls=$(grep -iE "Disallow:.*\.(pdf|docx?|xlsx?|pptx?|csv|zip|rar|tar\.gz)" robots.txt | awk '{print $2}')

# Download each file to the current directory
for file in $urls
do
  wget -q "$url$file"
done

# Remove the robots.txt file
rm robots.txt
