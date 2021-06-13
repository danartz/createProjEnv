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
    <script src=\"https://unpkg.com/@babel/polyfill@7/dist/polyfill.min.js\"></script>
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

printf "
{
 \"presets\": [
    [\"@babel/preset-env\", {
      \"targets\": {
      \"ie\": \"11\",
      \"edge\": \"15\",
      \"safari\": \"10\",
      \"firefox\": \"50\",
      \"chrome\": \"49\"
 }
 }],
 \"@babel/preset-react\"
 ]
}
"
cp ../environmentScripts/watchCompile.sh .
cp ../environmentScripts/run_server.sh .

npm install --save-dev @babel/core@7 @babel/cli@7
node_modules/.bin/babel --version
npm install --save-dev @babel/preset-react
npm install --save-dev webpack
echo "***Installation complete ****"


