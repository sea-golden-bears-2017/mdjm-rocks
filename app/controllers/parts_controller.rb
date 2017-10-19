class PartsController < ApplicationController
  def index
    if params[:name]
      @warehouse = Warehouse.find_by(name: params[:name])
      if @warehouse == nil
        @errors = ["Warehouse doesn't exist"]
        @parts = Part.all
      else
        @parts = @warehouse.parts.uniq
      end
    else
      @parts = Part.all
    end
  end
end
