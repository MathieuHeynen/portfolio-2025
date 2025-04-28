console.log("hello");

document.addEventListener("DOMContentLoaded", () => {
  const image = document.querySelector(".parallax-image");
  if (image) {
    window.addEventListener("scroll", () => {
      const scrolled = window.scrollY;
      image.style.transform = `translateY(${scrolled * 0.3}px)`;
    });
  }
});
