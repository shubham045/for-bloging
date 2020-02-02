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

  # before_validation :check_mobile_number

  # validate :check_any_error

  # private
  #
  #   def check_any_error
  #     if errors.any?
  #       errors.add(:user, "something is wrong")
  #     end
  #   end
  #
  # 	def check_mobile_number
  #     if mobile.present?
  #       country_code, mobile_number = mobile.split('-')
  #       unless valid_phone_number?(country_code, mobile_number)
  #         errors.add(:mobile, "Your mobile number is invalid")
  #       end
  #     end
  # 	end

end
