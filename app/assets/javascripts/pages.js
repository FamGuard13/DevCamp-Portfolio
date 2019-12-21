document.addEventListener('turbolinks:load', () => {
  let vh = window.innerHeight * 0.01;

  if (window.location.pathname === '/') {
    let touchDevice;

    document.documentElement.style.setProperty('--vh', `${vh}px`);
   
    const mobileSwipe = () => {
      const main = document.querySelector('main');
      const homeSection = getComputedStyle(document.body).getPropertyValue('--transform-shift');
    
      let start = 0;
      let shift = 0;
      let currentPosition = Number(homeSection.split('').slice(0, -2).join(''));
      let viewWidth = 0;
      let newPosition = 0;
      let pointerActive;
      
        main.addEventListener('pointerdown', (e) => {
          pointerActive = true;
          start = e.clientX;
        });
        
        main.addEventListener('pointermove', (e) => {
          if (pointerActive === true) {
            shift = e.clientX - start;
            viewWidth = (shift / screen.width) * 100;
            newPosition = currentPosition + viewWidth;
      
            document.documentElement.style.setProperty(`--transform-shift`, `${newPosition}vw`);
          }
        });
      
        main.addEventListener('pointerup', (e) => {
          pointerActive = false;
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

      window.addEventListener('touchstart', () => {
        const navLink = document.querySelectorAll('.nav-link');
        touchDevice = true;
        
        if (window.location.pathname === '/' && window.innerWidth > 651) {
  
          console.log('true')
          navLink.forEach(link => {
            let content = link.lastChild.textContent
  
            link.removeChild
  
            link.innerHTML = `<p>${content}</p>`
          })
        }
      })
  
      navLink.forEach(link =>  {
        if (touchDevice && window.innerWidth > 650) {
          link.addEventListener('touchstart', () => {
            transitionPage();
          } )
        } else {
          link.addEventListener('mouseenter', transitionPage)
        }
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

    if (window.innerWidth > 650) {
      desktopHover();
    } else {
      mobileSwipe();
    }
  }

  if (window.location.pathname === '/contact') {
    document.documentElement.style.setProperty(`--transform-shift`, `0vw`);
    let vh = window.innerHeight * 0.01;
  }
});