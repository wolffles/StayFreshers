require 'rails_helper'
require 'faker'

RSpec.describe MultipleChoicesController, type: :controller do
  context "signed_in" do
    before(:each) do
      @my_user = FactoryGirl.create(:user)
      sign_in @my_user
      @my_test_set = FactoryGirl.create(:test_set, user: @my_user)
      @my_multiple_choice = FactoryGirl.create(:multiple_choice, test_set: @my_test_set)
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
        expect(assigns(:multiple_choice)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of MultipleChoices by 1" do
        expect{post :create, params: { test_set_id: @my_test_set.id, :multiple_choice => { question: "test set question", correct_answer: "righto", a: "a", b: "b", c: "c", d: "righto" }}}.to change(MultipleChoice,:count).by(1)
      end

      it "assigns the new test set to @test_set" do
        post :create, params: { test_set_id: @my_test_set.id, :multiple_choice => { question: "test set question", correct_answer: "righto", a: "a", b: "b", c: "c", d: "righto" }}
        expect(assigns(:multiple_choice)).to eq MultipleChoice.last
      end
    end

    describe "GET edit" do
      it "returns http redirect and renders" do
        get :edit, params: { test_set_id: @my_test_set.id, id: @my_multiple_choice.id}
        expect(response).to have_http_status(:success)
        #being lazy and combined them
        expect(response).to render_template :edit
      end

      it "assigns test set to be updated to @test_set" do
        get :edit, params: {test_set_id: @my_test_set.id, id: @my_multiple_choice.id}
        test_set_instance = assigns(:multiple_choice)
        expect(test_set_instance.id).to eq @my_multiple_choice.id
        expect(test_set_instance.question).to eq @my_multiple_choice.question
        expect(test_set_instance.correct_answer).to eq @my_multiple_choice.correct_answer
        expect(test_set_instance.a).to eq @my_multiple_choice.a
        expect(test_set_instance.b).to eq @my_multiple_choice.b
        expect(test_set_instance.c).to eq @my_multiple_choice.c
        expect(test_set_instance.d).to eq @my_multiple_choice.d
      end
    end

    describe "PUT update" do
      it "updates @my_multiple_choice with expected attributes" do
        new_question = Faker::Hacker.noun
        new_correct_answer = Faker::Hacker.verb
        new_a = new_correct_answer
        new_b = Faker::Hacker.verb
        new_c = Faker::Hacker.noun
        new_d = Faker::Hacker.verb

        put :update, params: { test_set_id: @my_test_set.id, id: @my_multiple_choice.id,
           multiple_choice: {question: new_question,  correct_answer: new_correct_answer, a: new_a, b: new_b, c: new_c, d: new_d}}

        updated_test_set = assigns(:multiple_choice)
        expect(updated_test_set.id).to eq @my_multiple_choice.id
        expect(updated_test_set.question).to eq new_question
        expect(updated_test_set.correct_answer).to eq new_correct_answer
        expect(updated_test_set.a).to eq new_a
        expect(updated_test_set.b).to eq new_b
        expect(updated_test_set.c).to eq new_c
        expect(updated_test_set.d).to eq new_d
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: { test_set_id: @my_test_set.id, id: @my_multiple_choice.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, params: {test_set_id: @my_test_set.id, id: @my_multiple_choice.id}
        expect(response).to render_template(:show)
      end

      it "assigns @my_multiple_choice to :multiple_choice" do
        get :show, params: {test_set_id: @my_test_set.id, id: @my_multiple_choice.id}
        expect(assigns(:multiple_choice)).to eq(@my_multiple_choice)
      end
    end

    describe "Delete destroy" do
      it "deletes the test set" do
        delete :destroy, params: {test_set_id: @my_test_set.id, id: @my_multiple_choice.id}
        count = MultipleChoice.where({id: @my_multiple_choice.id}).size
        expect(count).to eq 0
      end

      it "redirects to the account page" do
        delete :destroy, params: {test_set_id: @my_test_set.id, id: @my_multiple_choice.id}
        expect(response).to redirect_to account_path
      end
    end
  end
end
