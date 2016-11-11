class DosesController < ApplicationController

  before_action :set_dose, only: [:destroy]
  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    @dose.save

    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy

    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
