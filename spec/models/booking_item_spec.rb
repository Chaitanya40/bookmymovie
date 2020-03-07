require 'rails_helper'

RSpec.describe BookingItem, type: :model do
  it { should belong_to(:booking) }
end
