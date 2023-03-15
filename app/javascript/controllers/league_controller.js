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
    this.channel = createConsumer().subscriptions.create(
      { channel: "LeagueChannel", id: this.leagueIdValue },
      { received: this.received }
    )
    console.log(`Subscribed to the league with the id ${this.leagueIdValue}.`)
    console.log(this.currentUserIdValue)
  }

  join(data) {
    this.playersTarget.insertAdjacentHTML("beforeend", data['user'])
  }

  start(data) {
    console.log('je suis dans start')
    console.log(data)
    this.updateRanking(data.ranking)
    this.updateChallenges(data.challenges)
    this.updateUserChallenges(data.user_challenges)
  }

  update(data) {
    console.log('je suis dans update')
    console.log(data)
    this.updateRanking(data.ranking)
    this.updateUserChallenges(data.user_challenges)
  }

  updateRanking(rankingHtml) {
    this.rankingTarget.outerHTML = rankingHtml
  }

  updateChallenges(challengesHtml) {
    this.leagueChallengesTarget.outerHTML = challengesHtml
  }

  updateUserChallenges(user_challenges) {
    const myChallengesHtml = user_challenges[this.currentUserIdValue]
    if (myChallengesHtml) {
      this.userChallengesTarget.outerHTML = myChallengesHtml
    }
  }

  received(json) {
    this[json.key](json.data)
  }
}
