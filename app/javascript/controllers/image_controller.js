import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["thumbnail"];

  switch(event) {
    const clickedThumbnail = event.currentTarget;
    const newImageUrl = clickedThumbnail.dataset.url;
    const mainImage = document.querySelector("#main-image");

    if (mainImage && newImageUrl) {
      mainImage.src = newImageUrl;
    }

    this.thumbnailTargets.forEach((t) => t.classList.remove("active"));
    clickedThumbnail.classList.add("active");
  }
}
