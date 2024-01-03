require 'rails_helper'

RSpec.describe Event, :type => :model do
  let!(:user) do
    User.create!(
      first_name: 'John',
      last_name: 'Alex',
      email: 'john@mailinator.com',
      password: 'Password1',
      password_confirmation: 'Password1'
    )
  end

  let!(:event) do
    Event.new(name: 'Anything',
      description: 'Lorem ipsum',
      start_time: DateTime.now + 1.day,
      end_time: DateTime.now + 2.day,
      organizer_id: user.id
    )
  end

  it 'is valid with valid attributes' do
    expect(event).to be_valid
  end

  it 'is not valid without a name' do
    event.name = nil
    expect(event).to_not be_valid
  end

  it 'is not valid without a start_time' do
    event.start_time = nil
    expect(event).to_not be_valid
  end

  it 'is not valid without a end_time' do
    event.end_time = nil
    expect(event).to_not be_valid
  end

  it 'is not valid when start_time is later than end_time' do
    event.start_time = DateTime.now + 2.day
    event.end_time = DateTime.now + 1.day
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:organizer) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
  end
end
