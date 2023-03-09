import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = [ "share", "token", "ordi", "mobile" ]

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
    if (navigator.share !== undefined) {
      navigator.share({
        title: 'join my league',
        url: `${url}?token=${this.tokenTarget.innerHTML}`
      })
      .then(() => console.log('Successful share'))
      .catch((error) => console.log('Error sharing', error));
    }
  }
}
