require 'rails_helper'

RSpec.describe "Calcs", type: :request do

  describe "GET /calc" do
    it "returns http success" do
      get "/?format=xml"
      expect(response).to have_http_status(:success)
    end

    it "returns correct result" do
      get "/?format=rss&less_than_number=1000"
      expect(response).to have_http_status(:success)
      expect(@response.headers['Content-Type']).to include('application/rss')
    end
  end

end
