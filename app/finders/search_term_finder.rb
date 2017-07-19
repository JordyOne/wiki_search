class SearchTermFinder
  def self.get_uniq_with_count
    SearchTerm.select(:term).group(:term).count
  end
end