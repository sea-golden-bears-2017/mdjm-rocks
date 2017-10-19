class WarehousesController < ApplicationController
  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      @parts = @warehouse.parts.uniq
      render "parts/index"
    else
      @errors = @warehouse.errors.full_messages
      render :new
    end
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name)
  end
end
