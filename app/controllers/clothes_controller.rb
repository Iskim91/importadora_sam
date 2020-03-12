class ClothesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_after_action :verify_authorized, only: :show
  before_action :find_clothe, only: %i[show edit update destroy]

  def index
    gender = session[:type]
    if gender == "Men"
      if params[:query].present?
        @clothes = policy_scope(Clothe).search_by_name_gender_and_category(params[:query]).where(gender: gender)
      else
        @clothes = policy_scope(Clothe).search_by_name_gender_and_category(params[:genders])
      end
    elsif gender == "Women"
      if params[:query].present?
        @clothes = policy_scope(Clothe).search_by_name_gender_and_category(params[:query]).where(gender: gender)
      else
        @clothes = policy_scope(Clothe).search_by_name_gender_and_category(params[:genders])
      end
    elsif gender == "Unisex"
      if params[:query].present?
        @clothes = policy_scope(Clothe).search_by_name_gender_and_category(params[:query]).where(gender: gender)
      else
        @clothes = policy_scope(Clothe).search_by_name_gender_and_category(params[:genders])
      end
    end
  end

  def show
    @transaction = Transaction.new
  end

  def new
    @clothe = Clothe.new
    authorize @clothe
  end

  def create
    @clothe = Clothe.new(clothe_params)
    authorize @clothe
    if @clothe.save
      redirect_to clothe_path(@clothe)
    else
      render :new
    end
  end

  def edit
    authorize @clothe
  end

  def update
    @clothe.update(clothe_params)
    authorize @clothe
    if @clothe.save
      redirect_to clothe_path(@clothe)
    else
      render :edit
    end
  end

  def destroy
    @clothe.destroy
  end

  private

  def clothe_params
    params.require(:clothe).permit(:name, :category, :description, :price, photos: [])
  end

  def find_clothe
    @clothe = policy_scope(Clothe).find(params[:id])
  end
end
