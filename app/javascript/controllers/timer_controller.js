import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"


export default class extends Controller {

  static values = {
    start: String
  }
  
  static targets = ['days', 'hours', 'minutes', "seconds"]

	initialize() {
  	this.refresh = this.refresh.bind(this)
  }

	refresh() {
    const now = (new Date()).getTime()
    const distance = this.start - now

    console.log(this.start)
    
    // console.log(this.start, now,  (new Date()).getTime())
    
    this.daysTarget.innerText = Math.floor(distance / (1000 * 60 * 60 * 24));
  	this.hoursTarget.innerText = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  	this.minutesTarget.innerText = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  	this.secondsTarget.innerText = Math.floor((distance % (1000 * 60)) / 1000);
  }

  connect() {
    this.start = Date.parse(this.startValue)  
		// console.log(this.startValue, this.start)
		setInterval(this.refresh, 1000)
  }
}
