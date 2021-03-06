require 'rails_helper'

describe PartsController, type: :controller do
  let!(:warehouse) {create(:warehouse)}
  let!(:part) {create(:part)}
  describe "parts#index" do
    it 'returns ok status' do
      get :index
      expect(response).to be_ok
    end
    it 'renders index view' do
      get :index
      expect(response).to render_template :index
    end
    context "when a specific warehouse's parts are requested" do
      before(:each) { get :index, params: {name: "Seattle"} }
      it 'creates a @warehouse instance variable' do
        expect(assigns[:warehouse]).to eq warehouse
      end
      it "creates a parts instance variable which includes only single warehouse's parts" do
        expect(assigns[:parts]).to eq warehouse.parts.uniq
      end
    end
    context "when companywide parts are requested" do
      it 'creates a @parts index variable which includes all parts' do
        get :index
        expect(assigns[:parts]).to eq Part.all
      end
    end
  end
end
