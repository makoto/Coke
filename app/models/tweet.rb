class Tweet < ActiveRecord::Base

	def self.fetch
    json = JSON.parse RestClient.get(CONFIG["api_url"] + "/tweets.json")
    json.map do |t|
      tweet = self.find_by_message_id(t["id"])
      if tweet
        tweet.counter+=1
        tweet.save!
      else
        self.create!({
          created_at:      t["created_at"],
          updated_at:      t["updated_at"],
          message:         t["message"],
          followers:       t["followers"],
          message_id:      t["id"],
          sentiment_score: t["sentiment"],
          user_handle:     t["user_handle"]
        })
      end
    end
    self.all
  end
end
