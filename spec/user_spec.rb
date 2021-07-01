require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures the username presence' do
      user= User.new(email: 'admin@example.com', password: 1234567).save
      expect(user).to eq(false)
    end
    it 'ensures the email presence' do
      user= User.new(username: 'admin', password: 1234567).save
      expect(user).to eq(false)
    end
    it 'ensures the password presence' do
      user = User.new(username: 'admin', email: 'admin@example.com').save
      expect(user).to eq(false)
    end
    it 'should save successfully' do
      user = User.new(username: 'admin', email: 'admin@example.com', password: 1234567).save
      expect(user).to eq(true)
    end
  end
end