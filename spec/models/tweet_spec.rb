require 'rails_helper'

RSpec.describe Tweet, type: :model do
    it 'has a created at date and time' do
        raw_tweet = Faker::Twitter.status
        tweet = Tweet.new(raw_tweet)

        expect(tweet.created_at[0..9]).to eq(raw_tweet[:created_at][0..9])
    end

    it 'has content' do
        raw_tweet = Faker::Twitter.status
        tweet = Tweet.new(raw_tweet)

        expect(tweet.text).to eq(raw_tweet[:text])
    end
end