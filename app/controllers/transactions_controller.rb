class TransactionsController < ApplicationController
  def show
    @transaction = current_user.transactions.find(params[:id])
    authorize @transaction
  end

  def create
    if Basket.find_by(status: "pending").nil?
      basket = Basket.create(user: current_user)
    else
      basket = Basket.find_by(status: "pending", user: current_user)
    end
    @clothe = Clothe.find(params.require(:transaction)[:clothe_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    @transaction.clothe = @clothe
    @transaction.amount = @clothe.price
    @transaction.clothe_sku = @clothe.sku
    @transaction.total_cents = @transaction.quantity * @clothe.price_cents
    @transaction.basket = basket
    @transaction.save
    if params[:commit] == "Checkout"
      redirect_to payment_basket_path(basket)
    else
      redirect_to clothe_path(@clothe)
    end
    authorize @transaction
    # session = Stripe::Checkout::Session.create(
    #   payment_method_types: ['card'],
    #   line_items: [{
    #     name: @clothe.sku,
    #     # images: @clothe.photos.first.key,
    #     amount: @clothe.price_cents,
    #     currency: 'usd',
    #     quantity: @transaction.quantity
    #   }],
    #   success_url: clothe_transaction_url(@clothe, @transaction),
    #   cancel_url: clothe_transaction_url(@clothe, @transaction)
    # )
    # @transaction.update(checkout_session_id: session.id)
    # redirect_to new_clothe_transaction_payment_path(@clothe, @transaction)
  end

  def update
    @transaction = Transaction.update(transaction_params)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:quantity, :color, :size, :clothe_id)
  end
end
