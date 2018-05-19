require 'rails_helper'

RSpec.feature "The login process", type: :feature do
  before :each do
    User.make(email: 'user@example.com', password: 'password')
  end
end
