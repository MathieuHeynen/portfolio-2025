function setBackTopAnimation() {
  const btn = document.getElementById("btn-back-top");
  if (!btn) return;

  // Pour éviter de double-register si turbo:load se relance :
  btn.removeEventListener("touchstart", onTouchStart);
  btn.removeEventListener("touchend", onTouchEnd);

  function onTouchStart() {
    btn.classList.add("is-touched");

    // Si un timer existe déjà, on le réinitialise
    clearTimeout(timeoutId);

    // Après 2 secondes, on retire la classe pour revenir à la flèche
    timeoutId = setTimeout(() => {
      btn.classList.remove("is-touched");
    }, 2000);
  }

  function onTouchEnd() {
    btn.classList.remove("is-touched");
  }

  btn.addEventListener("touchstart", onTouchStart);
  btn.addEventListener("touchend", onTouchEnd);
}

document.addEventListener("turbo:load", setBackTopAnimation);
// (optionnel) Pour compatibilité SSR/hors Turbo :
document.addEventListener("DOMContentLoaded", setBackTopAnimation);
