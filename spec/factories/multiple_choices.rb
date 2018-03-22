FactoryBot.define do
  factory :multiple_choice do
    question "question"
    correct_answer "righto"
    a "a"
    b "b"
    c "c"
    d "righto"
      #user_id isn't needed here because we pass the user param in when we call it in rspec.
  end
end
