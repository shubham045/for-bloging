class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include Verify
  has_many :articles
  attr_accessor :otp
  validates :mobile, presence: true
  validates :email, presence: true
  
  before_validation :check_mobile_number

  private

  	def check_mobile_number
      if mobile.present?
        country_code, mobile_number = mobile.split('-')
        unless valid_phone_number?(country_code, mobile_number)
          errors.add(:base, "Your mobile number is invalid")
        end
      end
  	end

end
