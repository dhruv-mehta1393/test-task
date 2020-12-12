class Campaign < ActiveRecord::Base
  enum est_duration: [:week, :month, :three_month]
  has_many :todos
  has_many :discussions
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :taggings
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :todos
  
  validates_presence_of :title, :purpose

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(title: name.strip).first_or_create!
    end
  end
  
  def all_tags
    self.tags.map(&:title).join(", ")
  end

end
