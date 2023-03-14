import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="league-subscription"
export default class extends Controller {
  static values = { leagueId: Number }
  static targets = ["players"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "UserLeagueChannel", id: this.leagueIdValue },
      { received: data => this.#insertPlayerAndScrollDown(data) }
    )
    console.log(`Subscribed to the league with the id ${this.leagueIdValue}.`)
  }


  #insertPlayerAndScrollDown(data) {
    this.playersTarget.insertAdjacentHTML("beforeend", data)
    this.playersTarget.scrollTo(0, this.playersTarget.scrollHeight)
    }

    resetForm(event) {
    event.target.reset()
    }

    disconnect() {
    console.log("Unsubscribed from the league")
    this.channel.unsubscribe()
    }
}
