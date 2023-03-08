import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {

  static targets = [ "startOn", "endOn" ]

  connect() {
    flatpickr(this.startOnTarget, {})
    flatpickr(this.endOnTarget, {})
    flatpickr(this.startOnTarget, { altInput: true, minDate: "today" })
    // flatpickr(this.startOnTarget, { mode: "range" })
    flatpickr(this.endOnTarget, { altInput: true })
  }

  
  
}
