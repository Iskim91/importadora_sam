class TransactionsController < ApplicationController
  def show
    @transaction = current_user.transactions.find(params[:id])
    authorize @transaction
  end

  def create
    @clothe = Clothe.find(params[:clothe_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    @transaction.clothe = @clothe
    @transaction.amount = @clothe.price
    @transaction.clothe_sku = @clothe.sku
    @transaction.total_cents = @transaction.quantity * @clothe.price_cents
    @transaction.save
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @clothe.sku,
        # images: @clothe.photos.first.key,
        amount: @clothe.price_cents,
        currency: 'usd',
        quantity: @transaction.quantity
      }],
      success_url: clothe_transaction_url(@clothe, @transaction),
      cancel_url: clothe_transaction_url(@clothe, @transaction)
    )
    @transaction.update(checkout_session_id: session.id)
    redirect_to new_clothe_transaction_payment_path(@clothe, @transaction)
    authorize @transaction
  end

  def update
    @transaction = Transaction.update(transaction_params)
  end

  def confirmation
    @clothe = Clothe.find(params[:clothe_id])
    @transaction = Transaction.new(transaction_params)
    authorize @transaction
  end

  private

  def transaction_params
    params.require(:transaction).permit(:quantity, :color, :size)
  end
end
