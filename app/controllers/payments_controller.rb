class PaymentsController < ApplicationController
  def new
    @basket = current_user.baskets.where(status: 'pending').find(params[:basket_id])
    @basket.transactions.each do |transaction|
      transaction.total_cents = transaction.quantity * transaction.clothe.price_cents
    end
    authorize @basket
  end
end
