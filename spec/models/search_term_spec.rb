require 'rails_helper'

describe SearchTerm, type: :model do
  let(:valid_attributes) do
    {
      term: "search term"
    }
  end

  it "is valid with valid attributes" do
    expect(described_class.new(valid_attributes)).to be_valid
  end

  it "is not valid unless term is present" do
    expect(described_class.new(term: nil)).to_not be_valid
  end
end
