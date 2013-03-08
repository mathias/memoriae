FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraphs(4).join('\n\n') }
    original_url { Faker::Internet.url }
    date_published { 2.days.ago }
    date_ingested { Time.now }
  end
end
