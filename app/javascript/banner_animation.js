document.addEventListener("turbo:load", () => {
  const track = document.querySelector(".skills-track");
  if (!track || track.dataset.animated) return;

  // Marquer comme déjà animé pour éviter les doublons
  track.dataset.animated = "true";

  const originalItems = Array.from(track.children);
  const screenWidth = window.innerWidth;

  // Dupliquer tant que ça ne rempli pas l'écran
  while (track.scrollWidth < screenWidth * 2) {
    for (const item of originalItems) {
      track.appendChild(item.cloneNode(true)); // Le paramètre true veut dire : "clone aussi tous les enfants"
    }
  }

  // Mesurer la première série complète avant la duplication
  let cycleWidth = 0;
  for (let i = 0; i < originalItems.length; i++) {
    cycleWidth += originalItems[i].getBoundingClientRect().width;
  }

  let offset = 0;
  const speed = 0.5;

  const animate = () => {
    offset -= speed;
    if (Math.abs(offset) >= track.scrollWidth / 2) {
      offset = 0;
    }

    track.style.transform = `translateX(${offset}px)`;
    requestAnimationFrame(animate);
  };

  animate();
});
