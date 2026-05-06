require "rails_helper"

RSpec.describe "Posts", type: :request do
  let(:fixtures_dir) { Rails.root.join("spec/fixtures/posts") }

  before { stub_const("Post::POSTS_DIR", fixtures_dir) }

  describe "GET /posts" do
    it "returns 200" do
      get "/posts"
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /posts/:slug" do
    it "returns 200 for an existing post" do
      get "/posts/test-post"
      expect(response).to have_http_status(200)
    end

    it "returns 404 for a missing post" do
      get "/posts/non-existent"
      expect(response).to have_http_status(404)
    end
  end
end
