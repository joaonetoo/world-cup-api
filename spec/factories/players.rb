FactoryBot.define do
  factory :player do
    name Player.all.sample.name
    position Player.all.sample.position
    age Player.all.sample.age
    team
  end
end
