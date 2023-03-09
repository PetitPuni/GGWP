import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = [ "share", "token" ]

  const shareData = {
    title: "MDN",
    text: "Learn web development on MDN!",
    url: "https://developer.mozilla.org",
  };

  connect() {
    console.log("ShareController connected")
    console.log(this.shareTarget)
    console.log(this.tokenTarget.innerHTML)
  }

  send() {
    navigator.share(shareData);
  }
}
