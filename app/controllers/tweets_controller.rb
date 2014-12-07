class TweetsController < ApplicationController
  def index
    @tweets = begin
      Tweet.fetch
    rescue RestClient::InternalServerError => e
      flash[:alert] = "There were problem getting response from twitter. Try again."
      []
    end
  end
end
