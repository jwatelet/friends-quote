class FavouritesController < ApplicationController
  before_action :require_signin
  before_action :set_quote

  def create
    @quote.favourites.create!(user: current_user)

    redirect_to @quote
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy if @favourite.user == current_user

    redirect_to @quote
  end

  private

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end
end
