class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  validates_presence_of :commentable, :body, :user
end
