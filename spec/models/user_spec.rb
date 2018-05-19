require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }
  it { should validate_presence_of(:email) }

  it 'has an email' do
    user = User.create(email: 'jasmin@hudacsek.com', password: 'taco123')
    email = user.email

    expect(email).to eq('jasmin@hudacsek.com')
  end
end
