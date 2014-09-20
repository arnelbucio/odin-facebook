require 'rails_helper'

RSpec.describe TextPost, type: :model do
  describe 'associations' do
    it { should have_one(:post) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end
