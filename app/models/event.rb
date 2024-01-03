class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User', foreign_key: 'organizer_id'

  has_many :events_users, dependent: :destroy
  has_many :users, through: :events_users

  validates :name, presence: true, length: { maximum: Constants::NAME_SIZE }
  validates :start_time, presence: true, length: { maximum: Constants::DESCRIPTION }
  validates :end_time, presence: true, after_date: :start_time

  has_one_attached :image
end
