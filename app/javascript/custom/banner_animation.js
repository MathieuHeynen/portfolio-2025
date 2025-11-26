let bannerAnimationId = null;
let resizeTimer = null;

function initSkillsBanner() {
  const track = document.querySelector(".skills-track");
  if (!track) return;

  // Sauvegarder le HTML original une seule fois
  if (!track.dataset.originalHtml) {
    track.dataset.originalHtml = track.innerHTML;
  } else {
    // Le remettre pour repartir d'une base propre
    track.innerHTML = track.dataset.originalHtml;
  }

  // Annuler une animation précédente si elle existe
  if (bannerAnimationId) {
    cancelAnimationFrame(bannerAnimationId);
    bannerAnimationId = null;
  }

  const originalItems = Array.from(track.children);
  const screenWidth = window.innerWidth;

  // Dupliquer tant que ça ne remplit pas au moins ~2x l'écran
  while (track.scrollWidth < screenWidth * 2) {
    for (const item of originalItems) {
      track.appendChild(item.cloneNode(true));
    }
  }

  let offset = 0;
  const speed = 0.5; // px par frame environ

  const animate = () => {
    offset -= speed;

    if (Math.abs(offset) >= track.scrollWidth / 2) {
      offset = 0;
    }

    track.style.transform = `translateX(${offset}px)`;
    bannerAnimationId = requestAnimationFrame(animate);
  };

  // Reset de la transform
  track.style.transform = "translateX(0)";
  animate();
}

function bindBanner() {
  initSkillsBanner();

  // Éviter d'ajouter plusieurs listeners à chaque turbo:load
  if (!window.__skillsBannerResizeBound) {
    window.addEventListener(
      "resize",
      () => {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(initSkillsBanner, 150);
      },
      { passive: true }
    );
    window.__skillsBannerResizeBound = true;
  }
}

document.addEventListener("turbo:load", bindBanner);
document.addEventListener("DOMContentLoaded", bindBanner);
