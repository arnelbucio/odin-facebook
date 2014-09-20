require 'rails_helper'

RSpec.describe PhotoPost, type: :model do
  describe 'association' do
    it { should have_one(:post) }
  end

  describe 'validation' do
    it { should validate_presence_of(:photo) }
  end
end
