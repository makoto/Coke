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
    self
  end

  def emotion
    if sentiment_score > 0
      "positive"
    elsif sentiment_score < 0
      "negative"
    elsif sentiment_score == 0
      "neutral"
    else
      raise "should not happen"
    end
  end
end
