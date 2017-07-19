require 'rails_helper'

describe SearchTermController, type: :controller do
  describe "#new" do
    it "assigns a new SearchTerm" do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
