class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @clothes = Clothe.all
  end
end
