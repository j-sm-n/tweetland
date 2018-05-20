require 'rails_helper'

RSpec.feature "The logout process", type: :feature do 
    it "allows a user to logout" do
        user = User.create(
            email: 'sam@test.com',
            password: 'taco123',
            password_confirmation: 'taco123'
        )
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit root_path
        click_on 'Logout'

        expect(page).to have_current_path(root_path)
        expect(page).to have_content "Logged out!"
    end
end
