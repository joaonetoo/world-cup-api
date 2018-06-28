FactoryBot.define do
  factory :match do
    date Match.all.sample.date.to_s
    stadium
  end
end
