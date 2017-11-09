require 'rails_helper'

RSpec.describe TestSet, type: :model do
  let(:my_user) { FactoryGirl.create(:user) }
 let(:my_test_set) { TestSet.create!(name:"name", subject:"subject", user_id: my_user.id ) }

  describe "TestSet" do
    it "has a User_id" do
      expect(my_test_set).to have_attributes(name:  "name", subject: "subject", user_id: my_user.id)
    end
  end
end
