module Utilities
  class UsagesController < ApplicationController
    before_action :authenticate_user!

    def index
      @utility = Utility.find(params[:utility_id])
      @usages = @utility.utility_usages
    end

    def new
      @utility = Utility.find(params[:utility_id])
      @usage = @utility.utility_usages.new
    end

    def create
      @utility = Utility.find(params[:utility_id])
      @usage = @utility.utility_usages.new(usage_params)
      @usage.projected = false

      if @usage.save
        redirect_to property_path(@utility.property)
      else
        render 'new'
      end
    end

    private

    def usage_params
      params.require(:usage).permit(:date, :reading)
    end
  end
end