let start = 0;
let shift = 0;
let currentPosition = 0;
let viewWidth = 0;
let newPosition = 0;

  document.addEventListener('touchstart', (e) => {
    start = e.touches[0].clientX;
  });

  document.addEventListener('touchmove', (e) => {
    shift = e.touches[0].clientX - start;
    viewWidth = (shift / screen.width) * 100;
    newPosition = currentPosition + viewWidth;
    document.documentElement.style.setProperty(`--transform-shift`, `${newPosition}vw`)
  });

  document.addEventListener('touchend', (e) => {
    currentPosition = newPosition;

    let positionDifference = currentPosition;
    console.log(positionDifference);

    function findDifference() {
      while (positionDifference < -100) {
        positionDifference += 100;
      }

      positionDifference = -100 - positionDifference;
    };

    findDifference();

    console.log(`Difference: ${positionDifference}`);
    console.log(`Current: ${currentPosition}`);
    let positionComplete = positionDifference + currentPosition;
    console.log(`Complete: ${positionComplete}`);
    currentPosition = positionComplete; 
    document.documentElement.style.setProperty(`--transform-shift`, `${positionComplete}vw`)
  });