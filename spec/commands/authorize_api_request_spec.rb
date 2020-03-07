require 'rails_helper'

describe AuthorizeApiRequest do
  before(:each) do
    @customer = FactoryBot.create(:customer)
  end

  context '#token not present' do
    it 'when token not found returns the error' do
      events = AuthorizeApiRequest.call({})
      expect(events[:error].first[:token]).to eq('Missing token')
    end
  end

  context '#token present' do
    it 'when token is incorrect throws the error' do
      headers = { 'Authorization' => 'Some random .string' }
      events = AuthorizeApiRequest.call(headers)
      expect(events[:error][0][:token]).to eq('Invalid token')
    end

    it 'when token is correct returns user' do
      headers = { 'Authorization' => AuthenticateUser.call(@customer.email, 'password')[:ok] }
      events = AuthorizeApiRequest.call(headers)
      expect(events[:ok]).to_not be_nil
    end
  end
end
