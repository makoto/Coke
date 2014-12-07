require 'rails_helper'

RSpec.describe Tweet, :type => :model do
  context 'fetch' do
    let(:fetched) {
      VCR.use_cassette('tweets') do
        Tweet.fetch
      end
    }

    it "fetches tweets from API" do
      expect(fetched.count).to eql 2
    end

    it "converts into tweet object" do
      expect(fetched.first).to be_a Tweet
    end
  end
end
