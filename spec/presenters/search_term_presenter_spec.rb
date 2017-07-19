require "rails_helper"

describe SearchTermPresenter do
  it "creates term attr reader" do
    expect(described_class.new(term: "new term")).to respond_to(:term)
  end

  it "creates attempts attr reader" do
    expect(described_class.new(attempts: 3)).to respond_to(:attempts)
  end
end