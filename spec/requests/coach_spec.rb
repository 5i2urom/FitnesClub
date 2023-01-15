require 'rails_helper'

RSpec.describe "Coaches", type: :request do
  describe "GET /timetable" do
    it "returns http success" do
      get "/coach/timetable"
      expect(response).to have_http_status(:success)
    end
  end

end
