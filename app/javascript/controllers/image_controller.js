import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["thumbnail"];

  switch(event) {
    const clickedWrapper = event.currentTarget;
    const newImageUrl = clickedWrapper.dataset.url;
    const mainImage = document.querySelector("#main-image");

    if (mainImage && newImageUrl) {
      mainImage.src = newImageUrl;
    }

    this.thumbnailTargets.forEach((wrapper) =>
      wrapper.classList.remove("active")
    );
    clickedWrapper.classList.add("active");
  }
}
