require "rails_helper"

RSpec.describe Post, type: :model do
  let(:fixtures_dir) { Rails.root.join("spec/fixtures/posts") }

  before { stub_const("Post::POSTS_DIR", fixtures_dir) }

  describe ".all" do
    it "returns all posts" do
      expect(Post.all.length).to eq(2)
    end

    it "sorts posts by published_at descending" do
      posts = Post.all
      expect(posts.first.slug).to eq("another-post")
      expect(posts.last.slug).to eq("test-post")
    end
  end

  describe ".find_by!" do
    it "returns the correct post by slug" do
      post = Post.find_by!(slug: "test-post")
      expect(post.title).to eq("Test Post")
    end

    it "raises ActiveRecord::RecordNotFound for a missing slug" do
      expect { Post.find_by!(slug: "non-existent") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "#to_param" do
    it "returns the slug" do
      post = Post.find_by!(slug: "test-post")
      expect(post.to_param).to eq("test-post")
    end
  end

  describe "#body" do
    it "renders markdown as HTML" do
      post = Post.find_by!(slug: "test-post")
      expect(post.body).to include("<strong>world</strong>")
    end
  end

  describe "#published_at" do
    it "parses the date from frontmatter" do
      post = Post.find_by!(slug: "test-post")
      expect(post.published_at.to_date).to eq(Date.new(2026, 1, 1))
    end
  end
end
