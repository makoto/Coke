require 'rails_helper'

RSpec.describe Tweet, :type => :model do
  context 'fetch' do
    it "fetches tweets from API" do
      VCR.use_cassette('tweets') do
        expect(Tweet.fetch.count).to eql 2
      end
    end
  end
end
