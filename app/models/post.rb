class Post < ApplicationRecord
  has_many :comments

  has_many :tags, :through => :taggings
  has_many :taggings, :as => :taggable






  validates_presence_of :body, :title



  def all_tags=(tags_string)
  tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  self.tags = new_or_found_tags
end


  def all_tags
    self.tags.map(&:name).join(", ")
  end

end
