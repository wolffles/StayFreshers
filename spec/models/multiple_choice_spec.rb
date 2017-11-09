require 'rails_helper'

RSpec.describe MultipleChoice, type: :model do
  let(:my_user) { FactoryGirl.create(:user) }
  let(:my_test_set) { FactoryGirl.create(:test_set, user: my_user) }
  let(:my_multiple) { FactoryGirl.create(:multiple_choice,test_set: my_test_set) }


  describe "MultipleChoice" do
   it "has question, answer and 4 choices 1 being right" do
     expect(my_multiple).to have_attributes(question: "question", correct_answer: "righto", a: "MyText", b: "MyText", c: "MyText", d: "righto", test_set_id: my_test_set.id)
   end
  end
end
