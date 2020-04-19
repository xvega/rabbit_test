FactoryBot.define do
  factory :reservation do
    rescuer_name { 'John Lennon' }
    day_limit { 10 }
    dog
  end
end
