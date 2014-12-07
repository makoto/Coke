class TweetsController < ApplicationController
  respond_to :html, :json
  def index
    @tweets = begin
      Tweet.fetch.order("sentiment_score desc")
    rescue RestClient::InternalServerError => e
      message = "There is a problem getting response from twitter. Try again."
      flash[:alert] = message
      []
    end
    respond_with @tweets
  end
end
