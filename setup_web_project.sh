#!/bin/bash

# Use AppleScript to get the save location
save_location=$(osascript -e 'tell app "Finder" to return POSIX path of (choose folder with prompt "Select the folder where you want to save the new project")')

# Prompt for project name
echo "Enter the name of the new project:"
read project_name

# Create a new directory for the project in the chosen location
full_path="$save_location$project_name"
mkdir "$full_path"

# Change to the directory
cd "$full_path"

# Initialize Git repository
git init

# Create basic folders
mkdir css js img

# Create files
echo "<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>$project_name</title>
    <link rel='stylesheet' href='css/style.css'>
</head>
<body>
    <h1>Welcome to $project_name!</h1>
    <script src='js/script.js'></script>
</body>
</html>" > index.html

echo "/* CSS file for $project_name */" > css/style.css

echo "// JavaScript file for $project_name" > js/script.js

# Open the project in Visual Studio Code
code .

echo "Project setup complete and opened in VS Code."
