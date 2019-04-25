echo Please enter the name of your new component
read pageName
mkdir ./src/components/$pageName/
mkdir ./src/components/$pageName/css/
mkdir ./src/components/$pageName/js/
echo "
    <p class=\"description\">$pageName</p>
" >> ./src/components/$pageName/index.html

echo "
import './css/style.scss'
import './js/index.js'
import './index.html'

if(typeof(module.hot) !== 'undefined') {
  module.hot.accept() // eslint-disable-line no-undef  
}
" >> ./src/components/$pageName/index.js

echo "

" >> ./src/components/$pageName/js/index.js

echo "
@import '../../Shared/mixins.scss';
" >> ./src/components/$pageName/css/style.scss
echo "Component created; please remember to import this index.js in any view index.js where this component will be used."