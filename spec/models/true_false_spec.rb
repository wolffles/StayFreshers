require 'rails_helper'

RSpec.describe TrueFalse, type: :model do
  let(:my_user) { FactoryGirl.create(:user) }
  let(:my_test_set) { FactoryGirl.create(:test_set, user: my_user) }
  let(:my_truefalse) { FactoryGirl.create(:truefalse,test_set: my_test_set) }


  describe "MultipleChoice" do
   it "has question and description" do
     expect(my_truefalse).to have_attributes(question: "question", correct_answer:false, test_set_id: my_test_set.id)
   end
  end
end
