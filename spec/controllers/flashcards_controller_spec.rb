require 'rails_helper'
require 'faker'

RSpec.describe FlashcardsController, type: :controller do
  context "signed_in" do
    before(:each) do
      @my_user = FactoryGirl.create(:user)
      sign_in @my_user
      @my_test_set = FactoryGirl.create(:test_set, user: @my_user)
      @my_flashcard = FactoryGirl.create(:flashcard, test_set: @my_test_set)
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
        expect(assigns(:flashcard)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of Flashcards by 1" do
        expect{post :create, params: { test_set_id: @my_test_set.id, :flashcard => { question: "test set question", description: "this is a description" }}}.to change(Flashcard,:count).by(1)
      end

      it "assigns the new test set to @test_set" do
        post :create, params: { test_set_id: @my_test_set.id, :flashcard => { question: "test set question", description: "this is a description", test_set: @my_test_set }}
        expect(assigns(:flashcard)).to eq Flashcard.last
      end
    end

    describe "GET edit" do
      it "returns http redirect and renders" do
        get :edit, params: { test_set_id: @my_test_set.id, id: @my_flashcard.id}
        expect(response).to have_http_status(:success)
        #being lazy and combined them
        expect(response).to render_template :edit
      end

      it "assigns test set to be updated to @test_set" do
        get :edit, params: {test_set_id: @my_test_set.id, id: @my_flashcard.id}
        test_set_instance = assigns(:flashcard)
        expect(test_set_instance.id).to eq @my_flashcard.id
        expect(test_set_instance.question).to eq @my_flashcard.question
        expect(test_set_instance.description).to eq @my_flashcard.description
      end
    end

    describe "PUT update" do
      it "updates @my_flashcard with expected attributes" do
        new_question = Faker::Hacker.noun
        new_description = Faker::Hacker.verb

        put :update, params: { test_set_id: @my_test_set.id, id: @my_flashcard.id,
           flashcard: {question: new_question,  description: new_description}}

        updated_test_set = assigns(:flashcard)
        expect(updated_test_set.id).to eq @my_flashcard.id
        expect(updated_test_set.question).to eq new_question
        expect(updated_test_set.description).to eq new_description
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: { test_set_id: @my_test_set.id, id: @my_flashcard.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, params: {test_set_id: @my_test_set.id, id: @my_flashcard.id}
        expect(response).to render_template(:show)
      end

      it "assigns @my_flashcard to :flashcard" do
        get :show, params: {test_set_id: @my_test_set.id, id: @my_flashcard.id}
        expect(assigns(:flashcard)).to eq(@my_flashcard)
      end
    end

    describe "Delete destroy" do
      it "deletes the test set" do
        delete :destroy, params: {test_set_id: @my_test_set.id, id: @my_flashcard.id}
        count = Flashcard.where({id: @my_flashcard.id}).size
        expect(count).to eq 0
      end

      it "redirects to the account page" do
        delete :destroy, params: {test_set_id: @my_test_set.id, id: @my_flashcard.id}
        expect(response).to redirect_to account_path
      end
    end
  end
end
