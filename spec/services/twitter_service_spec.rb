require 'rails_helper'

RSpec.describe TwitterService do
    it 'checks for valid handle' do
        VCR.use_cassette('twitter/verify_handle_true') do
            expect(TwitterService.is_valid_handle?('j_sm_n')).to be true
        end
    end

    xit 'checks for invalid handle' do
        VCR.use_cassette('twitter/verify_handle_false') do
            expect(TwitterService.is_valid_handle?('j/sm_n')).to be false
        end
    end

    xit 'gathers top 25 Tweet objects' do
        VCR.use_cassette('twitter/find_top_tweets_by_handle') do

        end
    end
end