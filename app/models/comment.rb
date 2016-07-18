class Comment < ApplicationRecord
  belongs_to :post, :polymorphic => true
  validates_presence_of :post, :body, :user
end
