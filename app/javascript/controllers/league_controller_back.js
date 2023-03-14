import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="league"
export default class extends Controller {
  static values = { leagueId: Number }
  static targets = ["userChallenges", "ranking", "players", "leagueChallenges"]

  initialize() {
    this.received = this.received.bind(this)
  }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "LeagueChannel", id: this.leagueIdValue },
      { received: this.received }
    )
    console.log(`Subscribed to the league with the id ${this.leagueIdValue}.`)
  }

  join(data) {
    this.playersTarget.insertAdjacentHTML("beforeend", data['user'])
  }

  start(data) {
    console.log('je suis dans start')
    console.log(data)
  }

  update(data) {
    console.log('je suis dans update')
    console.log(data)
  }

  received(json) {
    this[json.key](json.data)
  }
}
