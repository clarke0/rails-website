require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "Get #home" do
    it "returns a 200 response" do
      get "/"
      expect(response).to have_http_status(200)
    end
  end

  describe "Get #about" do
    it "returns a 200 response" do
      get "/about"
      expect(response).to have_http_status(200)
    end
  end
end
