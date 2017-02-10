class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find_by(name: params[:dose][:ingredient])
    @dose = Dose.new
    @dose.description = params[:dose][:description]
    @dose.ingredient = @ingredient
    @dose.cocktail = @cocktail
    if @cocktail.save && @ingredient.save && @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktail/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end


end
