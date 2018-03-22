FactoryBot.define do
  factory :flashcard do
    #user_id isn't needed here because we pass the user param in when we call it in rspec.
    question "question"
    description "description"
  end
end
