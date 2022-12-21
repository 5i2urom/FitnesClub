require 'rails_helper'

RSpec.describe "Services", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/service/show"
      expect(response).to have_http_status(:success)
    end
  end

end
