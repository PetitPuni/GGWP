import { Controller } from "@hotwired/stimulus"
import { createConsumer} from "@rails/actioncable"

// Connects to data-controller="challenges-subscription"
export default class extends Controller {
  static values = { leagueId: Number, userId: Number }
  static targets = ["challenges"]

  connect() {
    console.log('conect to challenges')
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChallengesChannel", id: this.leagueIdValue },
      { received: data => this.element.outerHTML = data }
    )
    console.log(`Subscribed to the league with the id ${this.leagueIdValue}.`)
  }


  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the challenges")
    this.channel.unsubscribe()
  }
}
