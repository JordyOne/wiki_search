class WikipediaSearch
  def self.search(term:)
    search_term = CGI.escape(term)
    HTTParty.get("https://en.wikipedia.org/w/api.php?action=query&format=json&list=search&srsearch=#{search_term}").body
  end
end