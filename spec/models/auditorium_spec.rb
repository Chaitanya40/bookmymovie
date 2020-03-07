require 'rails_helper'

RSpec.describe Auditorium, type: :model do
  it { should belong_to(:cinema) }
end
