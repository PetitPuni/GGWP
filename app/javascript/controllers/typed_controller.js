import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js'

// Connects to data-controller="typed"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ['Darius', 'Pudge', 'Wraith', 'Glados', 'Gordon', 'Heavy'],
      typeSpeed: 100,
      loop: true
    });
  }
}
