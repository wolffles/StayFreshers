require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:my_user) { FactoryGirl.create(:user) }
  let(:my_note) { FactoryGirl.create(:note, user: my_user) }

  describe "Note" do
    it "has a User_id" do
      expect(my_note).to have_attributes(subject: "subject", user_id: my_user.id)
    end
  end
end
