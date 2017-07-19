require "rails_helper"

describe SearchTermPresenter do
  before do
    SearchTerm.create(term: "term")
  end

  it "#term" do
    expect(described_class.new(term: "term", attempts: 1)).to respond_to(:term)
  end

  it "#attempts" do
    expect(described_class.new(term: "term", attempts: 3)).to respond_to(:attempts)
  end

  it "#recent_id" do
    expect(described_class.new(term: "term", attempts: 3)).to respond_to(:recent_id)
  end
end