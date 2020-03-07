require 'rails_helper'

describe AuthenticateUser do
  before(:each) do
    @customer = FactoryBot.create(:customer)
  end

  it 'when user not found returns the error' do
    events = AuthenticateUser.call('chaitanya@example.com', 'randomstring')
    expect(events[:error].first[:user_authentication]).to eq('User not found')
  end

  it 'when password is incorrect throws the error' do
    events = AuthenticateUser.call(@customer.email, 'password1')
    expect(events[:error][0][:user_authentication]).to eq('Invalid credentials')
  end

  it 'when password is correct returns token' do
    events = AuthenticateUser.call(@customer.email, 'password')
    expect(events[:ok]).to_not be_nil
  end
end
