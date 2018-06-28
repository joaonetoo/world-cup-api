FactoryBot.define do
  factory :team do
    name "Brazil"
    code "BR"
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
