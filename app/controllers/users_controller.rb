class UsersController < ApplicationController
  def history
    user = current_user
    @baskets = Basket.where(status: "paid", user: user)
    authorize user
  end
end
