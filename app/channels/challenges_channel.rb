class ChallengesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    league = League.find(params[:id])
    stream_for league
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
