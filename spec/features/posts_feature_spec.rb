require "rails_helper"
RSpec.feature "Posts", type: :feature do


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
  
  
    context "Create new post" do
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            visit new_post_path
        end


        scenario "should be successful" do
            fill_in "Description", with: "Test description"
            fill_in "Title", with: "Test title"
            click_button "Create Post"
            expect(page).to have_content("Post was successfully created")
        end
 
        scenario "should fail" do
            fill_in "Title", with: "Test title"
            click_button "Create Post"
            expect(page).to have_content("Description can't be blank")
        end


        scenario "should fail" do
            fill_in "Description", with: "Test description"
            click_button "Create Post"
            expect(page).to have_content("Title can't be blank")
        end
    end


    context "Update post" do
        let(:post) { Post.create(title: "Test title", description: "Test content") }
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            visit edit_post_path(post)
        end


        scenario "should be successful" do
            within("form") do
            fill_in "Description", with: "New description content"
            end
            click_button "Update Post"
            expect(page).to have_content("Post was successfully updated")
        end


        scenario "should fail" do
            within("form") do
                fill_in "Description", with: ""
            end
            click_button "Update Post"
            expect(page).to have_content("Description can't be blank")
        end


        scenario "should fail" do
            within("form") do
                fill_in "Title", with: ""
            end
            click_button "Update Post"
            expect(page).to have_content("Title can't be blank")
        end
    end

end

    #context "Delete post" do
       #let(:post) { Post.create(title: "Test title", description: "Test content") }
            #before(:each) do
            #user = FactoryBot.create(:user)
            #login_as(user)
            #visit root_path
        #end

        #scenario "should be successful" do
            #click_button "Destroy"
            #click_button "Ok"
            #expect(page).to have_content("Post was successfully destroyed.")
        #end
    #end
#end



