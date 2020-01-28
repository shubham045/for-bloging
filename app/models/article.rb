class Article < ApplicationRecord

  extend FriendlyId

  friendly_id :title, use: :slugged

  belongs_to :user

  has_many :comments, dependent: :destroy
  
  validates :title, presence: true

  validates :text, presence: true
	
end
