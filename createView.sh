echo Please enter the name of your new view
read pageName
mkdir ./src/views/$pageName/
mkdir ./src/views/$pageName/css/
mkdir ./src/views/$pageName/js/
echo "
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Argus App</title>
    <link rel=\"shortcut icon\" href=\"#\">
    <%- include ../../components/Shared/head.html %>
</head>
<body>
    <%- include ../../components/Shared/header.html %>
    <h1>Argus <%= hello %></h1>
    <p class=\"description\">$pageName</p>

    <%- include ../../components/Shared/footer.html %>
</body>
</html>
" >> ./src/views/$pageName/index.html

echo "
import './css/style.scss'
import './js/index.js'
import './index.html'

if(typeof(module.hot) !== 'undefined') {
  module.hot.accept() // eslint-disable-line no-undef  
}
" >> ./src/views/$pageName/index.js

echo "

" >> ./src/views/$pageName/js/index.js

echo "
@import '../../../components/Shared/mixins.scss';
" >> ./src/views/$pageName/css/style.scss

echo "View created; please remember to add the route and entry for this view to the webpack.config files."
