require 'rails_helper'

RSpec.describe "Starts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/start/show"
      expect(response).to have_http_status(:success)
    end
  end

end
