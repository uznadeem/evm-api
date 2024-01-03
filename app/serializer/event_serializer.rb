class EventSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :description, :start_time, :end_time, :image_url

  belongs_to :organizer
  has_many :users

  def image_url
    url_for(object.image) rescue nil
  end
end
