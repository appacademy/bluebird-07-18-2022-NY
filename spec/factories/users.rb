FactoryBot.define do
    factory :user do
        username { Faker::Movies::HarryPotter.character }
        email { Faker::Internet.email }
        password { 'password' }
        age { 20 }
        political_affiliation { Faker::Movies::HarryPotter.house }

        factory :harry_potter do
            username { 'Harry Potter' }
        end
    end
end