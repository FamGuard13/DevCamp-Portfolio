document.addEventListener('turbolinks:load', () => {
  const main = document.querySelector('main');

  let start = 0;
  let shift = 0;
  let currentPosition = 0;
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
  
      if (positionDifference < 0) {
        currentPosition = Math.ceil(currentPosition/100)*100
      } else {
        currentPosition = Math.floor(currentPosition/100)*100
      }
  
      if (currentPosition > 0) {
        currentPosition = 0;
      } else if (currentPosition < -400) {
        currentPosition = -400;
      }
  
      document.documentElement.style.setProperty(`--transform-shift`, `${currentPosition}vw`)
    });
})