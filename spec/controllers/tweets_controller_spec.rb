require 'rails_helper'

RSpec.describe TweetsController, :type => :controller do
  it "returns success" do
    VCR.use_cassette('tweets') do
      get 'index'
      expect(response).to be_success
    end
  end

  it "returns failed message" do
    VCR.use_cassette('api_error') do
      get 'index'
      expect(response).to be_success
      expect(flash[:alert]).to eq "There were problem getting response from twitter. Try again."
    end
  end
end
