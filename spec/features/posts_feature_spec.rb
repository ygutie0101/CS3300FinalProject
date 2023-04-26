require "rails_helper"

RSpec.feature "Posts", type: :feature do
    context "Update project" do
        let(:project) { Project.create(title: "Test title", description: "Test content") }
        before(:each) do
          visit edit_project_path(project)
        end
   
   
        scenario "should be successful" do
          within("form") do
            fill_in "Description", with: "New description content"
            fill_in "Title", with: "New title"
          end
          click_button "Update Project"
          expect(page).to have_content("Project was successfully created")
        end
   
   
        scenario "should fail" do
          within("form") do
            fill_in "Description can't be blank", with: "Description"
            fill_in "Title can't be blank", with: "Title"
          end
          click_button "Update Project"
          expect(page).to have_content("Description can't be blank")
          expect(page).to have_content("Title can't be blank")
        end
    end
    
    context "Login" do
        scenario "should sign up" do
          visit root_path
          click_link 'Sign up'
          within("form") do
            fill_in "Email", with: "testing@test.com"
            fill_in "Password", with: "123456"
            fill_in "Password confirmation", with: "123456"
            click_button "Sign up"
          end
          expect(page).to have_content("Welcome! You have signed up successfully.")
        end
    
    
    
    
        scenario "should log in" do
          user = FactoryBot.create(:user)
          login_as(user)
          visit root_path
          expect(page).to have_content("Logged in")
        end
      end
    end
end

    