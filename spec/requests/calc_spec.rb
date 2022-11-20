require 'rails_helper'

RSpec.describe "Calcs", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/calc/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /view" do
    it "returns http success" do
      get "/calc/view"
      expect(response).to have_http_status(:success)
    end
    it 'should return correct length on given parameters (n=1000)' do
      get '/calc/view?less_than_number=1000&commit=Find+palindroms'
      result = assigns(:result)
      expect(result.length).to eq(14)
    end
    it 'should return correct result on given parameters (n=100)' do
      get '/calc/view?less_than_number=100&commit=Find+palindroms'
      result = assigns(:result)
      expect(result).to eq([[1, 1], [2, 4], [3, 9], [11, 121], [22, 484], [26, 676]])
    end
  end

end
