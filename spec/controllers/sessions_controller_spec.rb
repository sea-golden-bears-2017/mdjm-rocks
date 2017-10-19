require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "sessions#new" do
    before(:each) { get :new }
    it "returns ok status" do
      expect(response).to be_ok
    end
  end

  describe "sessions#create" do
    let!(:user) { create(:user) }
    context "when login is succcessful" do
      before(:each) { post :create, params: {employee_num: 12345, password: 'password'} }
      xit "redirects to inventory#index" do
        expect(response).to redirect_to(parts_path)
      end
      it "creates a new session" do
        expect(session[:user_id]).to eq(user.id)
      end
    end
    context "when login is unsuccessful" do
      before(:each) { post :create, params: {employee_num: 12345, password: 'jazzword'} }
      it "assign an errors instance variable" do
        expect(assigns[:errors]).to eq('Invalid username or password')
      end
      it "returns ok status" do
        expect(response).to be_ok
      end
      it "renders :new" do
        expect(response).to render_template(:new)
      end
    end
  end
end
