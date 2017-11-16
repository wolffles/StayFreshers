require 'rails_helper'
require 'faker'

RSpec.describe TrueFalsesController, type: :controller do
  context "signed_in" do
    before(:each) do
      @my_user = FactoryGirl.create(:user)
      sign_in @my_user
      @my_test_set = FactoryGirl.create(:test_set, user: @my_user)
      @my_true_false = FactoryGirl.create(:true_false, test_set: @my_test_set)
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, params: { test_set_id: @my_test_set.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, params: { test_set_id: @my_test_set.id}
        expect(response).to render_template :new
      end

      it "instantiates @test_set" do
        get :new, params: { test_set_id: @my_test_set.id}
        expect(assigns(:true_false)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of TrueFalses by 1" do
        expect{post :create, params: { test_set_id: @my_test_set.id, :true_false => { question: "test set question", correct_answer: "this is a correct_answer" }}}.to change(TrueFalse,:count).by(1)
      end

      it "assigns the new test set to @test_set" do
        post :create, params: { test_set_id: @my_test_set.id, :true_false => { question: "test set question", correct_answer: "this is a correct_answer", test_set: @my_test_set }}
        expect(assigns(:true_false)).to eq TrueFalse.last
      end
    end

    describe "GET edit" do
      it "returns http redirect and renders" do
        get :edit, params: { test_set_id: @my_test_set.id, id: @my_true_false.id}
        expect(response).to have_http_status(:success)
        #being lazy and combined them
        expect(response).to render_template :edit
      end

      it "assigns test set to be updated to @test_set" do
        get :edit, params: {test_set_id: @my_test_set.id, id: @my_true_false.id}
        test_set_instance = assigns(:true_false)
        expect(test_set_instance.id).to eq @my_true_false.id
        expect(test_set_instance.question).to eq @my_true_false.question
        expect(test_set_instance.correct_answer).to eq @my_true_false.correct_answer
      end
    end

    describe "PUT update" do
      it "updates @my_true_false with expected attributes" do
        new_question = Faker::Hacker.noun
        new_correct_answer = true

        put :update, params: { test_set_id: @my_test_set.id, id: @my_true_false.id,
           true_false: {question: new_question,  correct_answer: new_correct_answer}}

        updated_test_set = assigns(:true_false)
        expect(updated_test_set.id).to eq @my_true_false.id
        expect(updated_test_set.question).to eq new_question
        expect(updated_test_set.correct_answer).to eq new_correct_answer
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: { test_set_id: @my_test_set.id, id: @my_true_false.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, params: {test_set_id: @my_test_set.id, id: @my_true_false.id}
        expect(response).to render_template(:show)
      end

      it "assigns @my_true_false to :true_false" do
        get :show, params: {test_set_id: @my_test_set.id, id: @my_true_false.id}
        expect(assigns(:true_false)).to eq(@my_true_false)
      end
    end

    describe "Delete destroy" do
      it "deletes the test set" do
        delete :destroy, params: {test_set_id: @my_test_set.id, id: @my_true_false.id}
        count = TrueFalse.where({id: @my_true_false.id}).size
        expect(count).to eq 0
      end

      it "redirects to the account page" do
        delete :destroy, params: {test_set_id: @my_test_set.id, id: @my_true_false.id}
        expect(response).to redirect_to account_path
      end
    end
  end
end
