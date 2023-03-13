import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"


export default class extends Controller {

  static values = {
    start: String
  }

  static targets = ['days', 'hours', 'minutes', "seconds",]

  connect() {
    this.start = new Date(this.startValue)
    console.log(this.startValue, this.start)
    setInterval(this.refresh, 1000)

  }

	initialize() {
    this.refresh = this.refresh.bind(this)
  }

	refresh() {
    const now = (new Date()).getTime();
    let distance = Math.abs(new Date(this.startValue) - now ) ;

    console.log(now)

    this.daysTarget.innerText = Math.floor(distance / (1000 * 60 * 60 * 24));
  	this.hoursTarget.innerText = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  	this.minutesTarget.innerText = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  	this.secondsTarget.innerText = Math.floor((distance % (1000 * 60)) / 1000);

  }
}
