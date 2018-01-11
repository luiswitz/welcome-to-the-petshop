FactoryBot.define do
  factory :scheduling do
    client
    date DateTime.now
    time Time.now
    status 1
  end
end
