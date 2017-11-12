require 'rails_helper'

RSpec.describe UserController, type: :controller do
  before(:each) do
    @my_user = FactoryGirl.create(:user)
    sign_in @my_user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
