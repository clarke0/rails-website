require "rails_helper"

RSpec.describe "Pages", type: :system do
  it "displays the home page" do
    visit "/"
    expect(page).to have_css("h1", text: "Welcome")
    expect(page).to have_link("About")
  end

  it "navigates from home to about" do
    visit "/"
    click_link "About"
    expect(page).to have_current_path("/about")
    expect(page).to have_css("h1", text: "About")
  end
end
