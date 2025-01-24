require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:address).dependent(:delete) }
    it { is_expected.to belong_to(:user) }
  end
end
