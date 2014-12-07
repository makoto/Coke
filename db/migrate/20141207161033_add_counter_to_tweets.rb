class AddCounterToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :counter, :integer, default: 1
  end
end
