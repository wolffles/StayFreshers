FactoryGirl.define do
  factory :true_false do
    question "question"
    correct_answer false
      #user_id isn't needed here because we pass the user param in when we call it in rspec.
  end
end
