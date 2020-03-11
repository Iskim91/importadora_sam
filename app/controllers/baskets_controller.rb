class BasketsController < ApplicationController
  def index
    @baskets = Basket.all
    authorize @baskets
  end

  def show
    @basket = Basket.find(params[:id])
    @basket.transactions.each do |transaction|
      total_cents = transaction.quantity * transaction.clothe.price_cents
      transaction.update(total_cents: total_cents)
    end
    authorize @basket
  end

  def payment
    @basket = Basket.find(params[:id])
    @basket.total = @basket.transactions.map { |transaction| transaction.amount * transaction.quantity }.sum
    if @basket.transactions.count > 0
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

end
