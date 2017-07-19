class SearchTermsController < ApplicationController
  def new
    @search_term = SearchTerm.new
    @previous_search_terms = find_previous_terms
  end

  def create
    @search_term = SearchTerm.new(search_term_params)
    if @search_term.save
      redirect_to search_term_path(@search_term)
    else
      @previous_search_terms = find_previous_terms
      render :new
    end
  end

  def duplicate
    @new_search_term = SearchTerm.find(params[:search_term_id]).dup
    if @new_search_term.save
      redirect_to search_term_path(@new_search_term)
    else
      render :show
    end
  end

  def show
    @search_term = SearchTerm.find(params[:id])
    @previous_search_terms = find_previous_terms
    @previous_runtimes = find_duplicate_runtimes
    @content = JSON.parse(WikipediaSearch.search(term: @search_term.term), symbolize: true)["query"]["search"]
    @new_search_term = SearchTerm.new
  end

  private

  def search_term_params
    params.require(:search_term).permit(:term, :id)
  end

  def find_duplicate_runtimes
    SearchTerm.where(term: @search_term.term).order(created_at: :desc).map(&:created_at)
  end

  def find_previous_terms
    search_presenters = SearchTermFinder.get_uniq_with_count.map do |unique_search_term|
      SearchTermPresenter.new(term: unique_search_term[0], attempts: unique_search_term[1])
    end
    reorder_presenters(search_presenters: search_presenters, sort_by: params[:sortby])
  end

  def reorder_presenters(search_presenters:, sort_by:)
    return search_presenters if sort_by.nil?
    search_presenters.sort! { |x,y| y.send(sort_by) <=> x.send(sort_by) }
  end
end
