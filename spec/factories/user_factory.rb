FactoryGirl.define do
  sequence(:email) do |n|
    Faker::Internet.email
  end

  sequence(:iin) do
    Faker::Number.number(12)
  end

  sequence(:password) do
    Faker::Internet.password(8)
  end

  factory :teacher, class: 'User' do
    email
    password
    first_name { Faker::Name.female_first_name }
    last_name { Faker::Name.female_last_name }
    iin
  end

  factory :student, class: 'User' do
    email
    password
    first_name { Faker::Name.male_first_name }
    last_name { Faker::Name.male_last_name }
    iin
  end

  factory :admin, class: 'User' do
    email
    password
    first_name { Faker::Name.female_first_name }
    last_name { Faker::Name.female_last_name }
    iin
  end

  factory :custodian, class: 'User' do
    email
    password
    first_name { Faker::Name.male_first_name }
    last_name { Faker::Name.male_last_name }
    iin
  end
end
