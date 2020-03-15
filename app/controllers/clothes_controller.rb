class ClothesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_after_action :verify_authorized, only: :show
  before_action :find_clothe, only: %i[show edit update destroy]

  def index
    gender = session[:type]
    if params[:query].present? && gender.present?
      @clothes = policy_scope(Clothe).search_by_name_gender_and_category(params[:query]).where(gender: gender)
    elsif gender.present?
      @clothes = policy_scope(Clothe).search_by_name_gender_and_category(params[:genders])
    else
      @clothes = policy_scope(Clothe).search_by_name_gender_and_category(params[:query])
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
    colors = params[:clothe][:color_ids]
    if @clothe.save
      colors.each { |color| @clothe.colors << Color.find(color.to_i) unless color.empty? }
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
    params.require(:clothe).permit(:name, :category, :description, :price, :gender, :color_ids, photos: [])
  end

  def find_clothe
    @clothe = policy_scope(Clothe).find(params[:id])
  end
end
