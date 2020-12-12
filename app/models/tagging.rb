class Tagging < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :tag
end
