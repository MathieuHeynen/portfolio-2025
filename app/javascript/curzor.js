function initCustomCursor() {
  const cursor = document.getElementById("custom-cursor");
  if (!cursor) return;

  // Désactive sur appareils sans souris
  const finePointer =
    window.matchMedia && window.matchMedia("(pointer: fine)").matches;
  if (!finePointer) {
    cursor.style.display = "none";
    document.body.style.cursor = ""; // curseur natif
    return;
  }

  // Montre le curseur custom & cache le natif
  cursor.style.display = "block";
  document.body.style.cursor = "none";

  // Positionner le curseur
  const move = (e) => {
    cursor.style.top = `${e.clientY}px`;
    cursor.style.left = `${e.clientX}px`;
    // première apparition
    if (cursor.style.opacity !== "1") cursor.style.opacity = "1";
  };

  // Gestion du hover sur éléments interactifs
  const setHoverListeners = (root = document) => {
    const hoverables = root.querySelectorAll(
      "a, button, .btn, .btn-clickable, [role='button']"
    );
    hoverables.forEach((el) => {
      el.addEventListener("mouseenter", () => cursor.classList.add("active"));
      el.addEventListener("mouseleave", () =>
        cursor.classList.remove("active")
      );
    });
  };

  // Nettoyage : éviter multiples bindings si Turbo recharge
  document.removeEventListener("mousemove", move);

  // Bind
  document.addEventListener("mousemove", move, { passive: true });
  setHoverListeners();

  // Si des éléments arrivent plus tard (Turbo/partials), on ré-applique
  const mo = new MutationObserver((muts) => {
    for (const m of muts) {
      if (m.addedNodes && m.addedNodes.length) setHoverListeners(document);
    }
  });
  mo.observe(document.documentElement, { childList: true, subtree: true });
}

// Turbo-ready
document.addEventListener("turbo:load", initCustomCursor);
// Fallback direct
document.addEventListener("DOMContentLoaded", initCustomCursor);
