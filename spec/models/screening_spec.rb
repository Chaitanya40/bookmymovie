require 'rails_helper'

RSpec.describe Screening, type: :model do
  it { should belong_to(:movie) }
  it { should belong_to(:auditorium) }
end
