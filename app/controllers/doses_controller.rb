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
    @dose.save
    @cocktail.save
    if @ingredient.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

end
