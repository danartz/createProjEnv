#!/bin/bash
proj=$1
mkdir ../$proj
cd ../$proj
echo "Installing Project ${proj}"
npm init
npm install express@4
mkdir src
mkdir server
mkdir public
printf "
<!DOCTYPE HTML> 
<html> 
  <head> 
    <meta charset="utf-8"> 
    <script src=\"https://unpkg.com/react@16/umd/react.development.js\"></script> 
    <script src=\"https://unpkg.com/react-dom@16/umd/react-dom.development.js\"></script> 
    <title>Pro MERN Stack</title> 
  </head> 
  <body> 
    <div id=\"contents\"></div> 
    <script src=\"/App.js\"></script> 
    <p>Hello this is a test web server</p> 
    
  </body> 
</html> 
" > public/index.html

printf "
const express = require('express'); 
const app = express(); 
app.use(express.static('public')); 
app.listen(3000, function() { 
    console.log('App started on port 3000'); 
}); 
" > server/server.js

printf "
const element = (
    <div title=\"outer div\">
      <h1> Hello Winston</h1>
    </div>
);
ReactDOM.render(element, document.getElementById('contents'));
" > src/App.jsx

cp ../run_server.sh .

npm install --save-dev @babel/core@7 @babel/cli@7
node_modules/.bin/babel --version
npm install --save-dev @babel/preset-react@7
npx babel src --presets @babel/react --out-dir public

echo "***Installation complete ****"


