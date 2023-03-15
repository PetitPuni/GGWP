import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = [ "share", "token", "ordi", "mobile" ]
  static values = { url: String }

  connect() {
    if (navigator.share !== undefined) {
      this.mobileTarget.classList.remove('d-none')
      this.ordiTarget.classList.add('d-none')
    }else{
      this.mobileTarget.classList.add('d-none')
      this.ordiTarget.classList.remove('d-none')
    }
  }

  send() {
    const url = window.location.href
    console.log(navigator.share);
    if (navigator.share !== undefined) {
      navigator.share({
        title: 'join my league',
        url: `${this.urlValue}`
      })
      .then(() => console.log('Successful share'))
      .catch((error) => console.log('Error sharing', error));
    }
  }
}
