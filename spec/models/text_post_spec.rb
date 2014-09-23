require 'rails_helper'

RSpec.describe TextPost, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end
