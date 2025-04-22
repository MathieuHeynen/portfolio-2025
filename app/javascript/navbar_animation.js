document.addEventListener("DOMContentLoaded", () => {
  const buttons = document.querySelectorAll(".navbar-button");
  const highlight = document.querySelector(".highlight");
  const activeButton = document.querySelector(".navbar-button.active");

  if (activeButton) {
    moveHighlightTo(activeButton);
  }

  buttons.forEach((button) => {
    button.addEventListener("mouseover", () => {
      moveHighlightTo(button);
    });

    button.addEventListener("mouseout", () => {
      const active = document.querySelector(".navbar-button.active");
      if (active) moveHighlightTo(active);
    });

    button.addEventListener("click", () => {
      buttons.forEach((btn) => btn.classList.remove("active"));
      button.classList.add("active");
    });
  });

  function moveHighlightTo(button) {
    const offsetLeft = button.offsetLeft;
    const offsetWidth = button.offsetWidth;
    highlight.style.left = `${offsetLeft}px`;
    highlight.style.width = `${offsetWidth}px`;

    // Supprime l'ancienne mise en surbrillance
    document.querySelectorAll(".navbar-button").forEach((btn) => {
      btn.classList.remove("highlighted");
    });

    // Ajoute la classe au bouton sous la pastille
    button.classList.add("highlighted");
  }
});
