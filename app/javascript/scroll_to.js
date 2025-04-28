// BOUTON HEY HOME PAGE
// --------------------
// --------------------
const btnHey = document.getElementById("btn-hey");

if (btnHey) {
  btnHey.addEventListener("click", function (event) {
    event.preventDefault();
    document
      .getElementById("self-presentation")
      .scrollIntoView({ behavior: "smooth" });
  });
}

// SCROLL TO THE TOP
// --------------------
// --------------------
document
  .getElementById("btn-back-top")
  .addEventListener("click", function (event) {
    event.preventDefault();
    document.getElementById("header").scrollIntoView({ behavior: "smooth" });
  });
