class Tweet < ActiveRecord::Base

	def self.fetch
    JSON.parse RestClient.get(CONFIG["api_url"] + "/tweets.json")
  end

end
