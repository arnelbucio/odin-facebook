require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:friend) }
    it { should validate_presence_of(:status) }
    it { should ensure_inclusion_of(:status).in_array(%w(pending requested accepted)) }
  end
end
