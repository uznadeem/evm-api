class EventsUser < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validate :attendee_not_organizer
  validates_uniqueness_of :user_id, scope: [:event_id], message: 'already joined the event'

  private

    def attendee_not_organizer
      self.errors.add(:base, "Organizer can't register as attendee") if self.event.organizer == self.user
    end
end
