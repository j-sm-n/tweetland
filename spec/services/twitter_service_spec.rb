require 'rails_helper'

RSpec.describe TwitterService do
    xit 'gathers top 25 Tweet objects' do
        VCR.use_cassette('twitter/find_top_tweets_by_handle') do

        end
    end
end