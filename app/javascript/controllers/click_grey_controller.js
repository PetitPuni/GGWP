import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="click-grey"
export default class extends Controller {

  static targets = [ "img" ]
  connect() {
    console.log("Hello, Stimulus!")   
  }
  grey() {
    console.log("grey")
    this.imgTargets.forEach(img => {
      img.classList.add("grey")
      console.log(img)
    });
  }
}
