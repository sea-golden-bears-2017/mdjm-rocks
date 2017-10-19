require 'rails_helper'

describe WarehousesController, type: :controller do
  describe '#new' do
    before(:each) do
      get :new
    end
    it 'sets a warehouse instance variable' do
      expect(assigns[:warehouse]).to be_a Warehouse
    end
    it 'returns an OK status' do
      expect(response).to be_ok
    end
  end

  describe '#create' do
    before(:each) do
      post :create, params: {warehouse: {name: "Seattle"}}
    end
    it 'sets an instance variable of a warehouse' do
      expect(assigns[:warehouse].name).to eq "Seattle"
    end
    it 'returns an OK status' do
      expect(response).to be_ok
    end

    context 'when warehouse is valid' do
      it 'assigns a parts variable' do
        expect(assigns[:parts]).to be_a Array
      end
      it 'renders the parts index show page' do
        expect(response).to render_template("parts/index")
      end
    end

    context 'when warehouse is invalid' do
      before(:each) do
        post :create, params: {warehouse: {name: nil}}
      end
      it 'assigns an errors variable' do
        expect(assigns[:errors]).to_not be_empty
      end
      it 'renders the new warehouse view' do
        expect(response).to render_template(:new)
      end
    end
  end
end
