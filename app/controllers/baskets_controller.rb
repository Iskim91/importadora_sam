class BasketsController < ApplicationController
  def index
    @baskets = Basket.all
    authorize @baskets
  end

  def show
    @basket = Basket.find(params[:id])
    authorize @basket
  end

  def payment
    @basket = Basket.find(params[:id])
    total = @basket.transactions.map { |transaction| transaction.total_cents }.sum
    @basket.total_cents = total
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @basket.id,
        # images: @clothe.photos.first.key,
        amount: @basket.total_cents,
        currency: 'usd',
        quantity: 1
      }],
      success_url: basket_url(@basket),
      cancel_url: basket_url(@basket)
    )
    @basket.update(checkout_session_id: session.id)
    redirect_to new_basket_payment_path(@basket)
    authorize @basket
  end
end
