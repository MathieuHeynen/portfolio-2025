document.addEventListener("turbo:load", () => {
  const burger = document.getElementById("burger-btn");
  const navbar = document.querySelector(".navbar");
  const overlay = document.getElementById("menu-overlay");

  // Reset initial state
  burger.classList.remove("open");
  navbar.classList.remove("open");
  overlay.classList.remove("active");

  burger.addEventListener("click", () => {
    const isOpen = burger.classList.toggle("open");
    navbar.classList.toggle("open");
    overlay.classList.toggle("active", isOpen); // ← active seulement si ouvert
    document.body.classList.toggle("no-scroll", isOpen);
  });
});
