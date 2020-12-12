class Discussion < ActiveRecord::Base
    belongs_to :campaign
    belongs_to :user
    has_many :comments, :as => :commentable
end
