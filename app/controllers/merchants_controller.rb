class MerchantsController < ApplicationController

  def index
    @merchant =  Merchant.filter(params, sort_column, sort_direction)
  end

  private
  # def apply_filter(params)
  #   if params[:specialization].present?
  #     @merchant = @merchant.where(specializations: {id: params[:specialization].map{|i| i.to_i}})
  #   end
  #   if params[:price_rng].present?
  #     if params[:price_rng].eql?('60')
  #       @merchant = @merchant.where('merchants.price > ?', 50)
  #     else
  #       @merchant = @merchant.where('merchants.price < ?',params[:price_rng])
  #     end
  #   end
  #   if params[:ratings].present?
  #     @merchant =  @merchant.where('merchants.avg_rating < ?', params[:ratings])
  #   end
  #   if params[:session_rng].present?
  #     if params[:session_rng].eql?('60')
  #       @merchant = @merchant.joins(:openings).where('(openings.end_time-openings.start_time) > INTERVAL ?', "50 minutes")
  #     else
  #       @merchant = @merchant.joins(:openings).where('(openings.end_time-openings.start_time) < INTERVAL ?', "#{params[:session_rng]} minutes")
  #     end
  #   end
  #   if params[:available].present?
  #     query = params[:available].split(',')
  #     if query.size == 1
  #       @merchant = @merchant.available.where('openings.start_time = ?', query[0])
  #     else
  #       @merchant = @merchant.available.where('openings.start_time >= ? and openings.start_time <= ?', query[0], query[1])
  #     end
  #   end
  # end
end
