class QuotesController < ApplicationController
  before_action :require_signin, except: %i[index show]

  def index
    @quotes = Quote.most_liked.page(params[:page])
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    @quote.user = current_user
    if @quote.save
      redirect_to quotes_url, notice: "Quote successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:text, :author)
  end
end
