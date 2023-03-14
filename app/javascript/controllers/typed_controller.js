import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js'

// Connects to data-controller="typed"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ['Mario', 'Link', 'Darius', 'Pudge', 'Wraith'],
      typeSpeed: 100,
      loop: true
    });
  }
}
