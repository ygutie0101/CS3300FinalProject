require "rails_helper"
RSpec.feature "HomePages", type: :feature do

    scenario "The visitor should see posts" do
      visit root_path
      expect(page).to have_text("Posts")
    end
  end
  