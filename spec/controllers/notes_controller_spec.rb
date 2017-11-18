require 'rails_helper'
require 'faker'

RSpec.describe NotesController, type: :controller do
  context "signed_in" do
    before(:each) do
      @my_user = FactoryGirl.create(:user)
      sign_in @my_user
      @my_note = FactoryGirl.create(:note, user: @my_user)
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @note" do
        get :new
        expect(assigns(:note)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of Notes by 1" do
        expect{post :create, params: { :note => { subject: "this is a subject", user: @my_user }}}.to change(Note,:count).by(1)
      end

      it "assigns the new test set to @note" do
        post :create, params: { :note => {  subject: "this is a subject", user: @my_user }}
        expect(assigns(:note)).to eq Note.last
      end
    end

    describe "GET edit" do
      it "returns http redirect and renders" do
        get :edit, params: { id: @my_note.id}
        expect(response).to have_http_status(:success)
        #being lazy and combined them
        expect(response).to render_template :edit
      end

      it "assigns test set to be updated to @note" do
        get :edit, params: {id: @my_note.id}
        note_instance = assigns(:note)
        expect(note_instance.id).to eq @my_note.id
        expect(note_instance.subject).to eq @my_note.subject
      end
    end

    describe "PUT update" do
      it "updates @my_note with expected attributes" do
        new_subject = Faker::Hacker.verb

        put :update, params: {id: @my_note.id, note: { subject: new_subject}}

        updated_note = assigns(:note)
        expect(updated_note.id).to eq @my_note.id
        expect(updated_note.subject).to eq new_subject
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: {id: @my_note.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, params: {id: @my_note.id}
        expect(response).to render_template(:show)
      end

      it "assigns @my_note to :note" do
        get :show, params: {id: @my_note.id}
        expect(assigns(:note)).to eq(@my_note)
      end
    end

    describe "Delete destroy" do
      it "deletes the test set" do
        delete :destroy, params: {id: @my_note.id}
        count = Note.where({id: @my_note.id}).size
        expect(count).to eq 0
      end

      it "redirects to the account page" do
        delete :destroy, params: {id: @my_note.id}
        expect(response).to redirect_to account_path
      end
    end
  end
end
