import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="league"
export default class extends Controller {
  static values = { leagueId: Number, currentUserId: Number }
  static targets = ["userChallenges", "ranking", "players", "leagueChallenges"]

  initialize() {
    this.received = this.received.bind(this)
  }

  connect() {
    console.log("coucou")
    console.log(this.leagueIdValue)
    console.log(this.currentUserIdValue)
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
    console.log("coucou start")
    console.log(data.user_challenges)
    this.updateRanking(data.ranking)
    this.updateChallenges(data.challenges)
    console.log( data.user_challenges)
    this.updateUserChallenges(data.user_challenges)
  }

  update(data) {
    console.log("coucou update")
    this.updateRanking(data.ranking)
    this.updateUserChallenges(data.user_challenges)
  }

  updateRanking(rankingHtml) {
    console.log("coucou update ranking")
    this.rankingTarget.outerHTML = rankingHtml
  }

  updateChallenges(challengesHtml) {
    console.log("coucou update challenges")
    this.leagueChallengesTarget.outerHTML = challengesHtml
  }

  updateUserChallenges(user_challenges) {
    console.log("coucou update user challenges")
    const myChallengesHtml = user_challenges[this.currentUserIdValue]
    if (myChallengesHtml) {
      this.userChallengesTarget.outerHTML = myChallengesHtml
    }
  }

  received(json) {
    this[json.key](json.data)
  }
}
