class PartsController < ApplicationController
  def index
    if params[:name]
      @warehouse = Warehouse.find_by(name: params[:name])
      @parts = @warehouse.parts.uniq
    else
      @parts = Part.all
    end
  end
end
