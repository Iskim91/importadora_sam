class TransactionsController < ApplicationController
  def show
    @transaction = current_user.transactions.find(params[:id])
    authorize @transaction
  end

  def create
    @clothe = Clothe.find(params[:clothe_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    @transaction.basket = @basket
    @transaction.clothe = @clothe
    @transaction.amount = @clothe.price
    @transaction.clothe_sku = @clothe.sku
    authorize @transaction
    if @transaction.save
      transaction_redirect
    else
      find_basket
      render "clothes/show"
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.update(params.require(:transaction).permit(:quantity))
    @basket = Basket.find(params[:basket_id])
    authorize @transaction
    redirect_to payment_basket_path(@basket)
  end

  def destroy
    @basket = Basket.find(params[:basket_id])
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    authorize @transaction
    redirect_to payment_basket_path(@basket)
  end

  private

  def transaction_redirect
    if params[:commit] == "Checkout"
      redirect_to payment_basket_path(@basket)
    else
      redirect_to clothe_path(@clothe)
    end
  end

  def transaction_params
    params.require(:transaction).permit(:quantity, :color, :size, :clothe_id)
  end
end
