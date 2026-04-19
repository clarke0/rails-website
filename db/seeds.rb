# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
Post.find_or_create_by!(slug: "hello-world") do |p|
  p.title = "Hello World"
  p.body = "This is my first post."
  p.published_at = Time.zone.parse("2026-04-19")
end

Post.find_or_create_by!(slug: "rails-webapp") do |p|
  p.title = "minimal website."
  p.body = "A simple website built with Rails."
  p.published_at = Time.zone.parse("2026-04-19")
end
