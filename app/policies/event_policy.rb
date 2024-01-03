class EventPolicy
  attr_reader :user, :event

  def initialize(user, event)
    @user = user
    @event = event
  end

  def update?
    user == event.organizer
  end

  def destroy?
    user == event.organizer
  end
end
