function initRouletteAnim() {
  document.querySelectorAll(".roulette-anim").forEach((el) => {
    // VÉRIFICATION RENFORCÉE - évite les doublons
    if (el.dataset.rouletteReady === "true") return;

    // Vérifier que l'élément n'a pas déjà des enfants .roulette-window
    if (el.querySelector(".roulette-window")) {
      console.log("Element already processed, skipping");
      return;
    }

    // Marquer comme prêt AVANT de traiter
    el.dataset.rouletteReady = "true";

    const original = el.textContent.trim(); // trim pour éviter espaces parasites

    // DEBUG : Afficher le texte original
    console.log("Processing roulette for:", original);

    el.innerHTML = "";

    let animating = false;

    [...original].forEach((char, i) => {
      const wrapper = document.createElement("span");
      wrapper.className = "roulette-window";
      wrapper.style.display = "inline-block";
      wrapper.style.overflow = "hidden";
      wrapper.style.height = "1em";
      wrapper.style.verticalAlign = "bottom";

      const roller = document.createElement("span");
      roller.className = "roulette-roller";
      roller.style.display = "block";
      roller.style.transition = "transform 0.34s cubic-bezier(.7,0,.5,1)";
      roller.style.willChange = "transform";
      roller.textContent = char === " " ? "\u00A0" : char;

      wrapper.appendChild(roller);
      el.appendChild(wrapper);
    });

    // DEBUG : Vérifier le résultat
    console.log(
      "Created",
      el.children.length,
      "spans for",
      original.length,
      "characters"
    );

    el.addEventListener("mouseenter", () => {
      if (animating) return;
      animating = true;
      const rollers = el.querySelectorAll(".roulette-roller");
      rollers.forEach((roller, idx) => {
        setTimeout(() => {
          roller.style.transform = "translateY(-110%)";
          setTimeout(() => {
            roller.style.transition = "none";
            roller.style.transform = "translateY(110%)";
            requestAnimationFrame(() => {
              roller.style.transition =
                "transform 0.34s cubic-bezier(.7,0,.5,1)";
              roller.style.transform = "translateY(0)";
            });
          }, 330);
        }, idx * 44);
      });
      setTimeout(() => {
        animating = false;
      }, rollers.length * 44 + 700);
    });
  });
}

// SOLUTION PLUS PROPRE - Un seul event listener
if (typeof window.rouletteInitialized === "undefined") {
  window.rouletteInitialized = true;

  // Pour Turbo
  document.addEventListener("turbo:load", initRouletteAnim);

  // Pour le cas où Turbo n'est pas actif
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initRouletteAnim);
  } else {
    initRouletteAnim(); // DOM déjà prêt
  }
}
