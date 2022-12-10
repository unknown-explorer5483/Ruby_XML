require 'rails_helper'

RSpec.describe "Proxy", type: :request do

  describe "GET /calc" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get "/proxy/view"
      expect(response).to have_http_status(:success)
    end

    it "returns different results" do
      get '/proxy/view.x?less_than_number=5654&route=server&commit=Find+palindroms'
      response_first = @response.body 
      get '/proxy/view.x?less_than_number=100&route=server&commit=Find+palindroms'
      response_second = @response.body 
      expect(response_first).not_to be eq(response_second)
    end

    it "returns correct result" do
      get '/proxy/view.x?less_than_number=5654&route=client&commit=Find+palindroms'
      expect(body.include?('/browser_render.xslt')).to be true
    end

    it "returns correct result" do
      get '/proxy/view.x?less_than_number=5654&route=server&commit=Find+palindroms'
      expect(body.include?('/browser_render.xslt')).to be false
    end
  end

end
