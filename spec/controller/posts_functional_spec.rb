require 'rails_helper'

# Change this ArticlesController to your project
RSpec.describe PostsController, type: :controller do
    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok) 
            end
        end
        context "GET #show" do
        
            let!(:post) { Post.create(title: "Test title", description: "Test description") }
                it "returns a success response" do 
                    expect(response).to have_http_status(:ok)
                end
            end 
        end
        
        context "GET #create" do
        # This should return the minimal set of attributes required to create a valid
        # Article. As you add validations to Article, be sure to adjust the attributes here as well.
        let(:valid_attributes) {
            { :title => "Test title!", :description => "This is a test description" }
        }

        let(:valid_session) { {} }

        describe "GET #create" do
            it "returns a success response" do
                Post.create! valid_attributes
                get :index, params: {}, session: valid_session
                expect(response).to have_http_status(:ok) # be_successful expects a HTTP Status code of 200
                #expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
            end
        end
    end
end