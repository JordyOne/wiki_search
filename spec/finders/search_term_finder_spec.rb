require 'rails_helper'

describe SearchTermFinder do
  context "no duplicates exist" do
    let!(:search_term_1) {SearchTerm.create(term: "Something")}
    let!(:search_term_2) {SearchTerm.create(term: "Something Different")}
    let!(:search_term_3) {SearchTerm.create(term: "Something Else Different")}
    let!(:search_term_4) {SearchTerm.create(term: "Something That Is Also Different")}
    it "returns a tuple of title and attempts" do
      expect(described_class.get_uniq_with_count).to include("Something" => 1)
      expect(described_class.get_uniq_with_count).to include("Something Different" => 1)
      expect(described_class.get_uniq_with_count).to include("Something Else Different" => 1)
      expect(described_class.get_uniq_with_count).to include("Something That Is Also Different" => 1)
    end
  end

  context "duplicates exist" do
    let!(:search_term_1) {SearchTerm.create(term: "Something")}
    let!(:search_term_2) {SearchTerm.create(term: "Something")}
    let!(:search_term_3) {SearchTerm.create(term: "Something Different")}
    let!(:search_term_4) {SearchTerm.create(term: "Something Different")}
    let!(:search_term_5) {SearchTerm.create(term: "Something Different")}
    it "returns a tuple of title and attempts" do
      expect(described_class.get_uniq_with_count).to include("Something" => 2)
      expect(described_class.get_uniq_with_count).to include("Something Different" => 3)
    end
  end
end