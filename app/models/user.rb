class User < ActiveRecord::Base
  extend Devise::Models

  devise :database_authenticatable, :registerable, :recoverable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :first_name, :last_name, presence: true, length: { maximum: Constants::NAME_SIZE }
end
