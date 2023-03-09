class UserLeagueChannel < ApplicationCable::Channel
  def subscribed
    league = League.find(params[:id])
    stream_for league
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
