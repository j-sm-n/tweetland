require 'rails_helper'

RSpec.describe Tweet, type: :model do
    it 'has a created at time' do
        raw_tweet = Faker::Twitter.status
        tweet = Tweet.new(raw_tweet)

        expect(tweet.created_at.to_s).to eq(raw_tweet[:created_at])
    end
end