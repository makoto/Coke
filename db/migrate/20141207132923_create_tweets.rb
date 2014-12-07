class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :followers
      t.integer :message_id
      t.string :message
      t.float  :sentiment_score
      t.string :user_handle
      # contains original tweet json from API
      t.text   :body
      t.timestamps
    end
  end
end