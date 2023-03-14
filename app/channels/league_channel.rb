class LeagueChannel < ApplicationCable::Channel
  def subscribed
    ap "je suis dans le subcribe de league channel"
    league = League.find(params[:id])
    stream_for league
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
