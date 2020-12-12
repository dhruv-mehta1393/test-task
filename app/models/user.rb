class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: [:qualified, :not_qualified, :banned]

  has_many :campaigns
  
  has_many :discussions

  enum role: %w[Novice Expert]

  has_many :comments, class_name: "comment", foreign_key: "reference_id"
end
