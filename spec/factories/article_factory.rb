FactoryGirl.define do
  factory :article do
    original_url { Faker::Internet.url }
    date_published { 2.days.ago }

    trait :ingested do
      title { Faker::Lorem.sentence }
      body { Faker::Lorem.paragraphs(4).join('\n\n') }
      date_ingested { Time.now }
      ingest_state { 'ingested' }
    end
  end
end
