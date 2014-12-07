class TweetsController < ApplicationController
  def index
    begin
      @tweets = Tweet.fetch
    rescue RestClient::InternalServerError => e
      flash[:alert] = "There were problem getting response from twitter. Try again."
    end
  end
end
