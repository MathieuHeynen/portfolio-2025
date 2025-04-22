const initNavbarHighlight = () => {
  const buttons = document.querySelectorAll(".navbar-button");
  const highlight = document.querySelector(".highlight");
  const activeButton = document.querySelector(".navbar-button.active");

  if (!highlight || buttons.length === 0 || !activeButton) return;

  // 👇 On rend la pastille invisible le temps de la positionner
  highlight.classList.remove("visible");

  // ✅ Attendre que tout soit prêt visuellement
  requestAnimationFrame(() => {
    moveHighlightTo(activeButton, true); // instantané sans animation
    requestAnimationFrame(() => {
      highlight.classList.add("visible"); // fade-in une fois bien placée
    });
  });

  buttons.forEach((button) => {
    button.addEventListener("mouseover", () => {
      moveHighlightTo(button);
    });

    button.addEventListener("mouseout", () => {
      const active = document.querySelector(".navbar-button.active");
      if (active) moveHighlightTo(active);
    });
  });

  function moveHighlightTo(button, instant = false) {
    if (!button) return;

    if (instant) {
      highlight.style.transition = "none";
    }

    const offsetLeft = button.offsetLeft;
    const offsetWidth = button.offsetWidth;
    highlight.style.left = `${offsetLeft}px`;
    highlight.style.width = `${offsetWidth}px`;

    document.querySelectorAll(".navbar-button").forEach((btn) => {
      btn.classList.remove("highlighted");
    });
    button.classList.add("highlighted");

    if (instant) {
      highlight.offsetHeight;
      highlight.style.transition = "";
    }
  }
};

document.addEventListener("DOMContentLoaded", initNavbarHighlight);
document.addEventListener("turbo:load", initNavbarHighlight);
