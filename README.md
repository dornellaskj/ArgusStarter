##Argus Starter

#Description
This is the starter project for all frontend work for the Agus projects.
This is a JQuery Single Page Application.
Tech: JQuery, JQueryMobile, EJS, Webpack, Babel

#Getting started
fork this project and create a new repo
create the upstream - git remote add upstream [upstream git URL]

For windows to enable scaffolding you will need to run - npm config set script-shell "C:\\Program Files\\git\\bin\\bash.exe"

#Commands
npm i - installs node modules
npm run watch - will run the dev build and watch for changes
npm run build - production build
npm run start - will start the production server
npm run gen:view - will run a script to scaffold out a new view for you
npm run gen:component - will run a script to scaffold out a new component

#Pulling changes from the upstream
git fetch upstream
git merge upstream/master