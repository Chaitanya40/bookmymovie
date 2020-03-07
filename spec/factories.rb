require 'faker'

FactoryBot.define do
  factory :customer do |f|
    f.email { Faker::Internet.email } 
    f.name { Faker::Name.name }
    f.password { 'password' }
  end
end
