function initRouletteAnim() {
  document.querySelectorAll(".roulette-anim").forEach((el) => {
    // Si déjà préparé, on ne le refait pas (pour éviter bugs si AJAX)
    if (el.dataset.rouletteReady) return;
    el.dataset.rouletteReady = "1";

    const original = el.textContent;
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

document.addEventListener("turbo:load", initRouletteAnim);
document.addEventListener("DOMContentLoaded", initRouletteAnim);
