class SearchController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :suggest

  def search
    @merchant = []
    unless params[:q].nil?
      @merchant = Merchant.search(params[:q], sort_column, sort_direction)
    end
    render 'merchants/index'
  end

  def suggest
    merchant = []
    unless params[:q].nil?
      merchant = Merchant.suggest params[:q]
    end
    render json: merchant
  end
end
