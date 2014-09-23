require 'rails_helper'

RSpec.describe PhotoPost, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:photo) }
  end
end
