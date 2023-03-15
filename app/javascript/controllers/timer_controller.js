import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"


export default class extends Controller {

  static values = {
    start: String,
    end: String
  }

  static targets = ['days', 'hours', 'minutes', "seconds", "affichage", "message"]

  connect() {
    console.log('connect with timer controller')
    console.log(this.startValue)
    this.start = new Date(this.startValue)
    this.end = new Date(this.endValue)
    console.log(this.start)
    setInterval(this.refresh, 1000)
  }

	initialize() {
    this.refresh = this.refresh.bind(this)
  }

  showTimer(distance){
    this.daysTarget.innerText = Math.floor(distance / (1000 * 60 * 60 * 24));
    this.hoursTarget.innerText = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    this.minutesTarget.innerText = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    this.secondsTarget.innerText = Math.floor((distance % (1000 * 60)) / 1000);
  }

  showEnd() {
    this.messageTarget.innerText = "The league is over ! Check who won 🏆!"
    this.messageTarget.classList.add("league-over")
    this.affichageTarget.classList.add("d-none")
  }

  showBefore(distance_start) {
    this.showTimer(distance_start)
    this.messageTarget.innerText = "The league starts on :"
    this.affichageTarget.classList.remove("d-none")
  }

  showActive(distance_end) {
    this.showTimer(distance_end)
    this.messageTarget.innerText = "The league ends on :"
    this.affichageTarget.classList.remove("d-none")
  }

	refresh() {
    const now = (new Date());
    let distance_end = this.end.getTime() - now.getTime();
    let distance_start =   this.start.getTime() - now.getTime() ;

    if (this.start.getTime() >= now.getTime() )
      this.showBefore(distance_start)
    else if (this.end.getTime() >= now.getTime() )
      this.showActive(distance_end)
    else
      this.showEnd()
  }
}
