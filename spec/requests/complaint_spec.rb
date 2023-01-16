require 'rails_helper'

RSpec.describe "Complaints", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/complaint/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /history" do
    it "returns http success" do
      get "/complaint/history"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /active" do
    it "returns http success" do
      get "/complaint/active"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /archive" do
    it "returns http success" do
      get "/complaint/archive"
      expect(response).to have_http_status(:success)
    end
  end

end
