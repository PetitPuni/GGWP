import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


// Connects to data-controller="ranking-subscription"
export default class extends Controller {
  static values = { leagueId: Number }
  static targets = ["ranking"]

  connect() {
    console.log('conect to ranking')
    this.channel = createConsumer().subscriptions.create(
      { channel: "rankingChannel", id: this.leagueIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribed to the league with the id ${this.leagueIdValue}.`)
  }

  #updateRanking(data) {
    this.rankingTarget.innerHTML(data)
    }

    resetForm(event) {
    event.target.reset()
    }

    disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
    }
}
