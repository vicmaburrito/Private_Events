require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validation test' do
    it 'ensures the presence of title' do
      event = Event.new(body: 'the dress code for the event', date: 20-5-2021, creator_id: 1).save
      expect(event).to eq false
    end
    it 'ensures the presence of body' do
      event = Event.new(title: 'beach', date: 20-5-2021, creator_id: 1).save
      expect(event).to eq false
    end
    it 'ensures the presence of date' do
      event = Event.new(body: 'the dress code for the event', title: 'beach', creator_id: 1).save
      expect(event).to eq false
    end
    it 'ensures the length of the body has 5 minimum' do
      event = Event.new(body: 'hey', title: 'beach', creator_id: 1).save
      expect(event).to eq false
    end


  end
end