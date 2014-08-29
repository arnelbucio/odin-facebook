require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:friendships).dependent(:destroy) }
    it { should have_many(:friends).conditions("status = 'accepted'").through(:friendships) }
    it { should have_many(:requested_friends).conditions("status = 'requested'").
                                              through(:friendships).source(:friend) }
    it { should have_many(:pending_friends).conditions("status = 'pending'").
                                            through(:friendships).source(:friend) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }

    it 'validates username format' do
      valid_usernames = ['a', 'a1', 'a_', 'a-', 'a'*20]
      valid_usernames.each do |username|
        user = build :user, username: username
        expect(user).to be_valid
      end
    end
  end
end
