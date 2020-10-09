#!
clear;
printf "\nCreating Web Development Environment...\n";

# Set up Dev Tools Webpack

git init;
git add .;
git commit -m "Initialize repo";

npm init -y;
npm i webpack --save-dev;
npm i webpack-cli --save-dev;

printf "Dev Tools setup...\n"

# Set up File / Folder Structure

mkdir src src/scss src/js;
mkdir dist;
mkdir etc;

printf "Created folders...\n"

touch webpack.config.js src/scss/main.scss src/index.js;
touch dist/index.html dist/style.css dist/main.js;
touch etc/helpers.txt

printf "Created files...\n"

# Populate Important Files

printf "const path = require('path');

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist'),
  },
};" >> webpack.config.js

printf "Helpers for Quick Setup:

IonIcons:   <script src=\"https://unpkg.com/ionicons@5.1.2/dist/ionicons.js\"></script>
            <ion-icon name="heart"></ion-icon>

Webpack:    https://webpack.js.org/guides/getting-started/

Bootstrap:  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>" >> etc/helpers.txt

printf "Populated files...\n";

# Cleanup

mv webdev.sh etc/;

read -n 1 -s -r -p "Web Dev Init Completed! Press Any Key to Exit..." 