require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validation test' do
    it 'ensures the presence of title' do
      event = Event.new(body: 'the dress code for the event', date: 20 - 5 - 2021, creator_id: 1).save
      expect(event).to eq false
    end
    it 'ensures the presence of body' do
      event = Event.new(title: 'beach', date: 20 - 5 - 2021, creator_id: 1).save
      expect(event).to eq false
    end
    it 'ensures the presence of date' do
      event = Event.new(body: 'the dress code for the event', title: 'beach', creator_id: 1).save
      expect(event).to eq false
    end
    it 'ensures the length of the body has 5 minimum' do
      event = Event.new(body: 'hey', title: 'beach', date: 20 - 5 - 2021, creator_id: 1).save
      expect(event).to eq false
    end
    it 'ensures the length of the title has 15 maximum' do
      event = Event.new(body: 'party on the beach',
                        title: 'the greates beach ever on humanity!', date: 20 - 5 - 2021, creator_id: 1).save
      expect(event).to eq false
    end
  end

  # context 'scopes test' do
  #   let (:params) { {title: 'beach party', body: 'party on the beach!', date: 2000-03-03, creator_id: 1 } }
  #   before(:each) do
  #     user1 = Event.new(params).save
  #     user2 = Event.new(params).save
  #     user3 = Event.new(params).save
  #     user4 = Event.new(params.merge(date: 2000-03-03)).save
  #     user5 = Event.new(params.merge(date: 2000-03-03)).save
  #   end
  #   it 'should return the events with an older date than now' do
  #     expect(Event.past.size).to eql(3)
  #   end
  # end
end

RSpec.describe Event, type: :model do
  it { should belong_to(:creator) }
  it { should have_many(:event_attendances) }
  it { should have_many(:attendees) }
end
