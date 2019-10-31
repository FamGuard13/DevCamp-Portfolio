const nav = document.querySelector('.nav-items');
const menuButton = document.querySelector('#menu-button');

menuButton.addEventListener('click', () => {
  nav.classList.toggle('show-nav');
});