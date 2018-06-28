FactoryBot.define do
  factory :team do
    name Team.all.sample.name
    code Team.all.sample.code
    group

    transient do
        amount 5
    end

    trait :with_players do
        after(:create) do |team,evaluator|
            create_list(:player,evaluator.amount, team: team)

        end
    end


  end
end
