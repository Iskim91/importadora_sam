class PaymentsController < ApplicationController
  def new
    @transaction = current_user.transactions.where(status: 'pending').find(params[:order_id], params[:transaction_id])
    authorize @transaction
  end
end
