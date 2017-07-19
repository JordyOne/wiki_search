class SearchTermPresenter
  attr_reader :term, :attempts, :recent_id
  def initialize(term:, attempts:)
    @term = term
    @recent_id = most_recent_id
    @attempts = attempts
  end

  private

  def most_recent_search_term
    @search_term ||= SearchTerm.order(created_at: :asc).where(term: @term).last
  end

  def most_recent_id
    most_recent_search_term.id
  end
end