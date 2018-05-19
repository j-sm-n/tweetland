require 'rails_helper'

RSpec.feature "The sign up process", type: :feature do
    it "doesn't display tweets to guests" do
        skip
        visit root_path

        expect(page).to have_content 'Welcome to Tweetland! Login or Sign up to see some tweets!'
        
        visit tweets_path
        expect(page).to have_content 'Welcome to Tweetland! Login or Sign up to see some tweets!'
    end

    it "allows new users to sign up" do
        visit signup_path
        within("#signup-form") do
            fill_in 'Email', with: 'user@example.com'
            fill_in 'Password', with: 'password'
            fill_in 'Password confirmation', with: 'password'
        end
    
        click_button 'Sign up'

        expect(page).to have_content 'Success! Welcome to Tweetland!'
    end
end