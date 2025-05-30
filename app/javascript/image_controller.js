import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["thumbnail"];

  switch(event) {
    const clickedThumbnail = event.currentTarget;
    const newImageUrl = clickedThumbnail.dataset.url;
    const mainImage = document.querySelector("#main-image");

    // Changer l’image principale
    mainImage.src = newImageUrl;

    // Gérer l’état "active" sur les miniatures
    this.thumbnailTargets.forEach((t) => t.classList.remove("active"));
    clickedThumbnail.classList.add("active");
  }
}
