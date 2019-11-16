document.addEventListener('turbolinks:load', () => {
  if (window.location.pathname == '/') {
    const mobileSwipe = () => {
      const main = document.querySelector('main');
      const homeSection = getComputedStyle(document.body).getPropertyValue('--transform-shift');
    
      let start = 0;
      let shift = 0;
      let currentPosition = Number(homeSection.split('').slice(0, -2).join(''));
      let viewWidth = 0;
      let newPosition = 0;
      
        main.addEventListener('touchstart', (e) => {
          start = e.touches[0].clientX;
        });
      
        main.addEventListener('touchmove', (e) => {
          shift = e.touches[0].clientX - start;
          viewWidth = (shift / screen.width) * 100;
          newPosition = currentPosition + viewWidth;
    
          document.documentElement.style.setProperty(`--transform-shift`, `${newPosition}vw`)
        });
      
        main.addEventListener('touchend', (e) => {
          let positionDifference = currentPosition - newPosition;
          currentPosition = newPosition;
      
          if (positionDifference < 10) {
            currentPosition = Math.ceil(currentPosition/100)*100
          } else {
            currentPosition = Math.floor(currentPosition/100)*100
          }
      
          if (currentPosition > 0) {
            currentPosition = 0;
          } else if (currentPosition < -400) {
            currentPosition = -400;
          }
      
          document.documentElement.style.setProperty(`--transform-shift`, `${currentPosition}vw`);
          document.documentElement.style.setProperty(`--swipe-transition`, `150ms`);
          setTimeout(() => {
            document.documentElement.style.setProperty(`--swipe-transition`, `0ms`);
          }, 151);
        });
    }
  
    const desktopHover = () => {
      const navLink = document.querySelectorAll('.nav-link');
  
      navLink.forEach(link =>  {
        link.addEventListener('mouseenter', transitionPage)
      })
  
      window.addEventListener('resize', resetOpacity);
    }
   
    function transitionPage() {
      const homeSections = document.querySelectorAll('.home-section');
      const menuSection = document.querySelector(`${this.dataset.tag}`);
  
      homeSections.forEach(section => {
        section.style.setProperty('opacity', '0');
        section.style.setProperty('z-index', '-1');
      })
  
      menuSection.style.setProperty('opacity', '1');
      menuSection.style.setProperty('z-index', '0');
    }
  
    function resetOpacity() {
      const homeSections = document.querySelectorAll('.home-section');
  
      if (window.innerWidth < 651) {
        homeSections.forEach(section => {
          section.style.setProperty('opacity', '1');
          section.style.setProperty('z-index', '1');
        })
      }
    }

    mobileSwipe();
    desktopHover();
  }
});