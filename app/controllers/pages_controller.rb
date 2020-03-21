class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if current_user.present? && current_user.admin
      @clothes = Clothe.all
    else
      @clothes = Clothe.all.where(publish: true)
    end
  end
end
