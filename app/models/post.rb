class Post < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :body, :title


  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

end
