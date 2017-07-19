require 'rails_helper'

describe SearchTermsController, type: :controller do
  describe "#new" do
    it "assigns a new SearchTerm" do
      get :new
      expect(response).to render_template(:new)
      expect(assigns(:search_term)).to be_a_new(SearchTerm)
    end
  end

  describe "#create" do
    context "term attribute is empty" do
      it "returns to form and adds error" do
        post :create, params: { :search_term => { :term => "" } }
        expect(response).to render_template(:new)
        expect(assigns(:search_term).errors.any?).to be true
        expect(assigns(:search_term).errors.full_messages).to include("Term can't be blank")
      end
    end
  end
end
