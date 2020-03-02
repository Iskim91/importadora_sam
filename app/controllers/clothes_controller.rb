class ClothesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_after_action :verify_authorized, only: :show
  before_action :find_clothe, only: %i[show edit update destroy]

  def index
    @clothes = policy_scope(Clothe)
  end

  def show
  end

  def new
    @clothe = Clothe.new
  end

  def create
    @clothe = Clothe.new(clothe_params)
    @clothe.user = current_user
    if @clothe.save
      redirect_to clothe_path(@clothe)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @clothe.update(clothe_params)
  end

  def destroy
    @clothe.destroy
  end

  private

  def clothe_params
    params.require(:clothe).permit(:name, :category, :description, :price, :photo)
  end

  def find_clothe
    @clothe = policy_scope(Clothe).find(params[:id])
  end
end
