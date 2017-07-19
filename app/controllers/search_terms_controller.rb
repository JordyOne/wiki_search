class SearchTermsController < ApplicationController
  def new
    @search_term = SearchTerm.new
  end

  def create
    @search_term = SearchTerm.new(search_term_params)
    if @search_term.save
      redirect_to search_term_path(@search_term)
    else
      render :new
    end
  end

  def show
    @search_term = SearchTerm.find(params[:id])
  end

  private

  def search_term_params
    params.require(:search_term).permit(:term, :id)
  end
end