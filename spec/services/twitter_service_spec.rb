require 'rails_helper'

RSpec.describe TwitterService do
    before(:each) do
        stub_request(:post, "https://api.twitter.com/oauth2/token").
            with(
                body: {"grant_type"=>"client_credentials"},
                headers: {
                'Accept'=>'*/*',
                'Authorization'=> ENV['twitter_spec_authorization'],
                'Connection'=>'close',
                'Content-Type'=>'application/x-www-form-urlencoded',
                'Host'=>'api.twitter.com',
                'User-Agent'=>'TwitterRubyGem/6.2.0'
            }).
            to_return(status: 200, body: "", headers: {})
    end

    xit 'checks for valid handle' do
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