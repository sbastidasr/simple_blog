class Tag < ApplicationRecord
validates_presence_of :name
has_many :taggings
has_many :posts, :through => :taggings, :source => :taggable, :source_type => "Post"
has_many :articles, :through => :taggings, :source => :taggable, :source_type => "Article"

end
