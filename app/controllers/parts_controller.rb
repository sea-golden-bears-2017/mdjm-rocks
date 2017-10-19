class PartsController < ApplicationController
  def index
    if params[:name]
      @warehouse = Warehouse.find_by(name: params[:name])
    else
      @parts = Part.all
    end
  end
end
