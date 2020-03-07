require 'rails_helper'

RSpec.describe Booking, type: :model do
  it { should belong_to(:customer) }
  it { should belong_to(:screening) }
end
