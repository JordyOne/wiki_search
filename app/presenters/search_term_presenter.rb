class SearchTermPresenter
  attr_reader :term, :attempts
  def initialize(term: nil, attempts: nil)
    @term = term
    @attempts = attempts
  end
end