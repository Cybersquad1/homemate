class UtilityPricesController < ApplicationController
  before_action :require_landlord

  def new
    @utility = Utility.find(params[:utility_id])
    @utility_charge = @utility.utility_prices.new
  end

  def create
    @utility = Utility.find(params[:utility_id])
    @utility_charge = @utility.utility_prices.new(charge_params)

    if @utility_charge.valid?
      @utility_charge.save

      redirect property_path(@utility.property)
    else
      render 'new'
    end
  end

  private

  def charge_params
    params.require(:utility_charge).permit(:name, :price, :usage_based, :usage_unit, :length_unit)
  end
end