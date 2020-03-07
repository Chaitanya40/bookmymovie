require 'rails_helper'

RSpec.describe Seat, type: :model do
  it { should belong_to(:screening) }
  it { should belong_to(:seating_category) }
end
