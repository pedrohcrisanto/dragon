require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:contact) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:country) }
  end

  describe "full_address" do
    it "returns the full address" do
      address = Address.new(street: "Rua das Flores", number: "100", city: "São Paulo", state: "SP", zip_code: "12345-678", country: "Brasil")
      expect(address.full_address).to eq("Rua das Flores, 100, São Paulo, SP, Brasil")
    end
  end
end
