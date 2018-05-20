require 'rails_helper'

RSpec.feature "Twitter handle search", type: :feature do 
    it "allows user to see top 25 tweets of specific user" do
        user = User.create(
            email: 'jaz@test.com',
            password: 'taco123',
            password_confirmation: 'taco123'
        )
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit tweets_path

        within("#tweet-search") do
            fill_in 'twitter-handle-search', with: "@j_sm_n"
        end
        click_button 'Search'

        within('#tweets') do
            expect(page).to have_css('li .tweet', count: 25)
        end
    end
end