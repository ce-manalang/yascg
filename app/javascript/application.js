// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "config"
import "channels"

var splashScreen = document.querySelector('.splash');
splashScreen.addEventListener('click',()=>{
  splashScreen.style.opacity = 0;
  setTimeout(()=>{
    // transition : 0.5s;
    // display : none;
    splashScreen.classList.add('duration-75')
    splashScreen.classList.add('hidden')
  },610)
})