class TweetsController < ApplicationController
  def index
    @tweets = begin
      Tweet.fetch.order("sentiment_score desc")
    rescue RestClient::InternalServerError => e
      message = "There is a problem getting response from twitter. Try again."
      flash[:alert] = message
      []
    end
  end
end
