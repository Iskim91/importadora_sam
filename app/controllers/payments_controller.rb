class PaymentsController < ApplicationController
  def new
    @basket = current_user.baskets.where(status: 'pending').find(params[:basket_id])
    authorize @basket
  end
end
