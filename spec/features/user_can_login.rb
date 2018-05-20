require 'rails_helper'

RSpec.feature "The login process", type: :feature do 
    it "allows a user to login" do
        user = User.create(
            email: 'sam@test.com',
            password: 'taco123',
            password_confirmation: 'taco123'
        )
        visit login_path
        within("#login-form") do
            fill_in 'Email', with: user.email
            fill_in 'Password', with: 'taco123'
        end
        click_button 'Login'

        expect(page).to have_current_path(tweets_path)
        expect(page).to have_content "Logged in as sam@test.com"
        expect(page).to have_content 'Look up tweets by Twitter handle'
    end

    it "throws error when info is incorrect" do
        user = User.create(
            email: 'sam@test.com',
            password: 'taco123',
            password_confirmation: 'taco123'
        )
        visit login_path
        within("#login-form") do
            fill_in 'Email', with: user.email
            fill_in 'Password', with: 'taco13'
        end
        click_button 'Login'

        expect(page).to have_current_path(login_path)
        expect(page).to have_content 'Username and/or Password is invalid. Try again.'
    end
end
