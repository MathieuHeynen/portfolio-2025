document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("work-intro");
  const works = JSON.parse(container.dataset.works);

  let index = 0;
  let currentUrl = works[0].url;

  const blur = document.getElementById("works-blur");
  const number = document.getElementById("work-number");
  const client = document.getElementById("work-client");
  const title = document.getElementById("work-title");

  let intervalId;
  function showSlide(idx) {
    const work = works[idx];
    if (work.image) blur.style.backgroundImage = `url('${work.image}')`;
    if (number) number.textContent = work.number;
    if (client) client.textContent = work.client;
    if (title) title.textContent = work.title;
    currentUrl = work.url;
  }

  function startCarousel() {
    intervalId = setInterval(() => {
      index = (index + 1) % works.length;
      showSlide(index);
    }, 4000);
  }

  // Démarrage initial
  showSlide(index);
  startCarousel();

  // Clic redirige
  container.style.cursor = "pointer";
  container.addEventListener("click", () => {
    window.location.href = currentUrl;
  });
});
