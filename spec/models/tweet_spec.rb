require 'rails_helper'

RSpec.describe Tweet, :type => :model do
  context 'fetch' do
    let(:fetched) {
      VCR.use_cassette('tweets') do
        Tweet.fetch
      end
    }

    it "fetches tweets from API" do
      expect(fetched.count).to eq 2
    end

    it "has all the values" do
      expect(fetched.first.attributes).to eq({
       "counter" => 1,
       "created_at" => DateTime.parse('Thu, 27 Sep 2012 16:15:41 +00:00'),
       "followers" => 25,
       "id" => 1,
       "message" => "Remember cola bottles?  Mmm...",
       "message_id" => 9,
       "sentiment_score" => 0.8,
       "updated_at" => DateTime.parse('Thu, 27 Sep 2012 16:15:41 +00:00'),
       "user_handle" => "@sweetie"
      })
    end


    it "converts into tweet object" do
      expect(fetched.first).to be_a Tweet
    end

    context 'counter' do
      it "has default" do
        expect(fetched.first.counter).to eq 1
      end

      it "store duplicates" do
        FactoryGirl.create(:tweet, message_id:9)
        Tweet.first.counter
        expect(Tweet.first.counter).to eq 1
        VCR.use_cassette('tweets') do
          results = Tweet.fetch
          expect(Tweet.first.counter).to eq 2
        end
      end
    end

    context 'emotion' do
      %w{1 0.7 0.1}.each do |score|
        it "#{score} is positive" do
          expect(
            FactoryGirl.build(:tweet, sentiment_score:score).emotion
          ).to eq "positive"
        end
      end

      %w{-1 -0.7 -0.1}.each do |score|
        it "#{score} is negative" do
          expect(
            FactoryGirl.build(:tweet, sentiment_score:score).emotion
          ).to eq "negative"
        end
      end

      it "0 is neutral" do
        expect(
          FactoryGirl.build(:tweet, sentiment_score:0).emotion
        ).to eq "neutral"
      end
    end
  end
end
