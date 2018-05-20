require 'rails_helper'

RSpec.feature "Twitter handle search", type: :feature do 
    def sign_in_user
        user = User.create(
            email: 'jaz@test.com',
            password: 'taco123',
            password_confirmation: 'taco123'
        )
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it "allows user to see top 25 tweets of specific user" do
        sign_in_user
        visit tweets_path
        within("#tweet-search") do
            fill_in 'handle_search', with: "j_sm_n"
        end
        click_button 'Search'

        expect(page).to have_current_path(tweets_path)
        within('#tweets') do
            expect(page).to have_css('li .tweet', count: 25)
        end
    end

    # it "sanitizes Twitter handdle when handle starts with @" do
    #     skip
    #     visit tweets_path
    #     within("#tweet-search") do
    #         fill_in 'handle_search', with: "@j_sm_n"
    #     end
    #     click_button 'Search'

    #     within('#tweets') do
    #         expect(page).to have_css('li .tweet', count: 25)
    #     end
    # end

    # it "throws error message when Twitter handle doesn't exist" do
    #     skip
    #     visit tweets_path
    #     within("#tweet-search") do
    #         fill_in 'handle_search', with: "@j/sm_n"
    #     end
    #     click_button 'Search'

    #     within('#tweets') do
    #         expect(page).to have_content "Twitter handle doesn't exist"
    #     end
    # end

    # it "shows appropriate message for users with no tweets" do
    #     skip
    #     visit tweets_path
    #     within("#tweet-search") do
    #         fill_in 'handle_search', with: "@joe111"
    #     end
    #     click_button 'Search'

    #     within('#tweets') do
    #         expect(page).to have_content 'This user has no tweets'
    #     end
    # end
end