#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p gcode_data

# Read each line from projects.txt and download the file
while IFS= read -r line
do
  # Extract project name from URL
  project_name=$(echo "$line" | sed -E 's|.*/([^/]+)/source-archive.zip|\1|')
  wget -O "gcode_data/${project_name}.zip" "$line"
done < "projects.txt"
