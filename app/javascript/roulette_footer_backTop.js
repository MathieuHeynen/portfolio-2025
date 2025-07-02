function setBackTopAnimation() {
  const btn = document.getElementById("btn-back-top");
  if (!btn) return;

  // Pour éviter de double-register si turbo:load se relance :
  btn.removeEventListener("touchstart", onTouchStart);
  btn.removeEventListener("touchend", onTouchEnd);

  function onTouchStart() {
    btn.classList.add("is-touched");
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
