FactoryBot.define do
  factory :discount do
    title 'the-money-discount'  
    value 60.00

    trait :money do
      kind :money
    end

    trait :percentual do
      kind :percentual
    end
  end
end
