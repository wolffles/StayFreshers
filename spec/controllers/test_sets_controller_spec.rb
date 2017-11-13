require 'rails_helper'
require 'faker'

RSpec.describe TestSetsController, type: :controller do
  context "signed_in" do
    before(:each) do
      @my_user = FactoryGirl.create(:user)
      sign_in @my_user
      @my_test_set = FactoryGirl.create(:test_set, user: @my_user)
    end
    # describe "GET #index" do
    #   it "returns http success" do
    #     get :index
    #     expect(response).to have_http_status(:success)
    #   end
    #
    #   it "renders index view" do
    #     get :index
    #     expect(response).to render_template :index
    #   end
    # end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @test_set" do
        get :new
        expect(assigns(:test_set)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of TestSets by 1" do
        expect{post :create, params: { :test_set => { name: "test set name", subject: "this is a subject", user: @my_user }}}.to change(TestSet,:count).by(1)
      end

      it "assigns the new test set to @test_set" do
        post :create, params: { :test_set => { name: "test set name", subject: "this is a subject", user: @my_user }}
        expect(assigns(:test_set)).to eq TestSet.last
      end
    end

    describe "GET edit" do
      it "returns http redirect and renders" do
        get :edit, params: { id: @my_test_set.id}
        expect(response).to have_http_status(:success)
        #being lazy and combined them
        expect(response).to render_template :edit
      end

      it "assigns test set to be updated to @test_set" do
        get :edit, params: {id: @my_test_set.id}
        test_set_instance = assigns(:test_set)
        expect(test_set_instance.id).to eq @my_test_set.id
        expect(test_set_instance.name).to eq @my_test_set.name
        expect(test_set_instance.subject).to eq @my_test_set.subject
      end
    end

    describe "PUT update" do
      it "updates @my_test_set with expected attributes" do
        new_name = Faker::Hacker.noun
        new_subject = Faker::Hacker.verb

        put :update, params: {id: @my_test_set.id, test_set: {name: new_name,  subject: new_subject}}

        updated_test_set = assigns(:test_set)
        expect(updated_test_set.id).to eq @my_test_set.id
        expect(updated_test_set.name).to eq new_name
        expect(updated_test_set.subject).to eq new_subject
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: {id: @my_test_set.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, params: {id: @my_test_set.id}
        expect(response).to render_template(:show)
      end

      it "assigns @my_test_set to :test_set" do
        get :show, params: {id: @my_test_set.id}
        expect(assigns(:test_set)).to eq(@my_test_set)
      end
    end

    describe "Delete destroy" do
      it "deletes the test set" do
        delete :destroy, params: {id: @my_test_set.id}
        count = TestSet.where({id: @my_test_set.id}).size
        expect(count).to eq 0
      end

      it "redirects to the account page" do
        delete :destroy, params: {id: @my_test_set.id}
        expect(response).to redirect_to account_path
      end
    end
  end
end
