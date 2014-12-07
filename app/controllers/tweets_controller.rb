class TweetsController < ApplicationController
  def index
    @tweets = begin
      Tweet.fetch
    rescue RestClient::InternalServerError => e
      flash[:alert] = "There is a problem getting response from twitter. Try again."
      []
    end
  end
end
