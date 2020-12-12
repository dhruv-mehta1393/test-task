class Tag < ActiveRecord::Base
  has_many :subtags, :class_name => "Tag", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent_tag, :class_name => "Tag"
  has_many :taggings
  has_many :campaigns, through: :taggings
end
