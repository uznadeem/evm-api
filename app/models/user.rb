class User < ActiveRecord::Base
  extend Devise::Models

  devise :database_authenticatable, :registerable, :recoverable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :organized_events, foreign_key: 'organizer_id', class_name: 'Event'
  has_many :events_users, dependent: :destroy
  has_many :events, through: :events_users

  validates :first_name, :last_name, presence: true, length: { maximum: Constants::NAME_SIZE }
end
