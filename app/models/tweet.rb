class Tweet < ActiveRecord::Base

	def self.fetch
    json = JSON.parse RestClient.get(CONFIG["api_url"] + "/tweets.json")
    json.map do |t|
      self.new({
        created_at:      t["created_at"],
        updated_at:      t["updated_at"],
        message:         t["message"],
        followers:       t["followers"],
        message_id:      t["message_id"],
        sentiment_score: t["sentiment"],
        user_handle:     t["user_handle"]
      })
    end
  end
end
