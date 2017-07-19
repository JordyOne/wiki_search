require 'rails_helper'

describe SearchTermsController, type: :controller do
  let!(:previous_search_term) { SearchTerm.create(term: "term") }

  describe "#new" do

    it "assigns a new SearchTerm" do
      get :new
      expect(response).to render_template(:new)
      expect(assigns(:search_term)).to be_a_new(SearchTerm)
      expect(assigns(:previous_search_terms)).to be_a(Array)
      expect(assigns(:previous_search_terms)[0]).to be_a(SearchTermPresenter)
    end
  end

  describe "#duplicate" do

    it "duplicates a SearchTerm and redirects" do
      expect{
        get :duplicate, params: {search_term_id: previous_search_term.id}
      }.to change{SearchTerm.count}.from(1).to(2)
      expect(response).to redirect_to search_term_path(SearchTerm.last.id)
    end
  end

  describe "#create" do
    context "term attribute is empty" do
      it "returns to form and adds error" do
        post :create, params: { :search_term => { :term => "" } }
        expect(response).to render_template(:new)
        expect(assigns(:search_term).errors.any?).to be true
        expect(assigns(:search_term).errors.full_messages).to include("Term can't be blank")
        expect(assigns(:previous_search_terms)).to be_a(Array)
        expect(assigns(:previous_search_terms)[0]).to be_a(SearchTermPresenter)
      end
    end
  end
end
