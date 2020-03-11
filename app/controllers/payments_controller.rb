class PaymentsController < ApplicationController
  def new
    @basket.transactions.each do |transaction|
      total_cents = transaction.quantity * transaction.clothe.price_cents
      transaction.update( total: total_cents)
    end
    @basket.total = @basket.transactions.map { |transaction| transaction.total }.sum
    authorize @basket
  end
end
