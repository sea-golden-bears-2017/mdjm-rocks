require 'rails_helper'

describe PartsController, type: :controller do
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
      let!(:warehouse) {create(:warehouse)}
      let!(:part) {create(:part)}
      before(:each) do
        get :index, params: {name: "Seattle"}
      end
      it 'creates a @warehouse instance variable' do
        expect(assigns[:warehouse]).to eq warehouse
      end
      it 'creates a parts instance variable' do
        expect(assigns[:parts]).to eq warehouse.parts.uniq
      end
    end
  end
end
