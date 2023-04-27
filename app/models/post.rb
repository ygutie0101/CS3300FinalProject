require "rails_helper"
class Post < ApplicationRecord
    validates_presence_of :title, :description
end
