require "rails_helper"

RSpec.describe Post, :type => :model do 
    context "validation tests" do
        it "ensures the title is present when creating project" do 
            post = Post.new(description: "Content of the description") 
            expect(post.valid?).to eq(false)
        end

        it "should not be able to save project when title missing" do
            post = Post.new(description: "Some description content goes here")
            expect(post.save).to eq(false) 
        end
        
        it "should be able to save project when have description and title" do 
            post = Post.new(title: "Title", description: "Content of the description")
            expect(post.save).to eq(true)
        end     
    end
end

describe "Project Attribute Requirements on Edit", :type => :model do 
    context "Edit project" do
        before (:each) do
        @post = Post.create(title: "Title", description: "Content of the description")
    end

    it "ensures the title is present when editing project" do
        @post.update(:title => "New Title")
        expect(@post.title == "New Title") end
    end 
end