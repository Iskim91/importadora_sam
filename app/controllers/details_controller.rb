class DetailsController < ApplicationController
  def create
    @detail = Detail.new(params.require(:detail).permit(:information, :photo))
    @clothe = Clothe.find(params[:clothe_id])
    @detail.clothe = @clothe
    authorize @detail
    if @detail.save
      respond_to do |format|
        format.html { redirect_to clothe_path(@clothe) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'clothe/show' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @detail = Detail.find(params[:id])
    @clothe = @detail.clothe
    authorize @detail
    if @detail.destroy
      respond_to do |format|
        format.html { redirect_to clothe_path(@clothe) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'clothes/show' }
        format.js  # <-- idem
      end
    end
  end

end
