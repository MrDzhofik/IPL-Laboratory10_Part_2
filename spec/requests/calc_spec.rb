require 'rails_helper'

RSpec.describe "Calcs", type: :request do

  # при запросе xml мы получаем успех
  describe "GET /calc" do
    it "returns http success" do
      get "/?format=xml"
      expect(response).to have_http_status(:success)
    end

    #  проверяем, что при запросе rss мы получаем ответ в том же формате
    it "returns correct result" do  
      get "/?format=rss&power=5"
      expect(response).to have_http_status(:success)
      expect(@response.headers['Content-Type']).to include('application/rss')
    end
  end

end
