class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles

  validates :mobile, presence: true

  before_validation :check_mobile_number

  before_save :check_errors


  private
  	def check_mobile_number
  		return true
  	end

  	def check_errors
  		unless errors.any?
  		 	return true
  		end 
  	end

end
