class TransactionsController < ApplicationController
  def show
    @transaction = Transaction.find(params[:id])
    authorize @transaction
  end

  def create
    @clothe = Clothe.find(params[:clothe_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    @transaction.clothe = @clothe
    authorize @transaction
    if @transaction.save
      redirect_to clothe_path(@clothe)
    else
      render "clothes/show"
    end
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
    params.require(:transaction).permit(:quantity, :size, :color, :clothe_id)
  end
end
