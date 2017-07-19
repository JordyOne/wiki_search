class SearchTermPresenter
  attr_reader :term, :attempts, :recent_id
  def initialize(term:, attempts:)
    @term = term
    @recent_id = most_recent_id(term: term)
    @attempts = attempts
  end

  private

  def most_recent_id(term:)
    SearchTerm.order(created_at: :asc).where(term: term).pluck(:id).last
  end
end