class SearchTermPresenter
  attr_reader :term, :attempts, :recent_id, :created_at
  def initialize(term:, attempts:)
    @term = term
    @recent_id = most_recent_search_term.id
    @attempts = attempts
    @create_at = most_recent_search_term.created_at
  end

  private

  def most_recent_search_term
    @search_term ||= SearchTerm.order(created_at: :asc).where(term: @term).last
  end
end