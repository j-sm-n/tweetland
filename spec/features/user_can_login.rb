require 'rails_helper'

RSpec.feature "The login process", type: :feature do 
    it "allows a user to login" do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
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
        expect(page).to have_content 'Look up tweets by Twitter handle'
    end
end
