require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures the username presence' do
      user = User.new(email: 'klaus@email.com', password: 123_456).save
      expect(user).to eq(false)
    end
    it 'ensures the email presence' do
      user = User.new(username: 'klaus', password: 123_456).save
      expect(user).to eq(false)
    end
    it 'ensures the password presence' do
      user = User.new(username: 'klaus', email: 'klaus@email.com').save
      expect(user).to eq(false)
    end
    it 'should save successfully' do
      user = User.new(username: 'klaus', email: 'klaus@email.com', password: 123_456).save
      expect(user).to eq(true)
    end
  end
end

RSpec.describe User, type: :model do
  it { should have_many(:events) }
  it { should have_many(:event_attendances) }
  it { should have_many(:attended_events) }
end
