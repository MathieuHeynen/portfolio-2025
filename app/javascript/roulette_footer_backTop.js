document.addEventListener("DOMContentLoaded", () => {
  // Optionnel : sur mobile, change au tap/click
  const btn = document.getElementById("btn-back-top");
  if (!btn) return;
  btn.addEventListener("touchstart", () => {
    btn.classList.add("is-touched");
  });
  btn.addEventListener("touchend", () => {
    btn.classList.remove("is-touched");
  });
});
