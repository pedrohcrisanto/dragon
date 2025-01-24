require "rails_helper"

RSpec.describe ::ContactList::Destroy, type: :case do
  subject(:result) do
    described_class.call(
      contact: contact
    )
  end
  let!(:contact) { create(:contact, :with_address) }

  describe ".call" do
    it "destroys the contact and address" do
      expect { result }.to change(Contact, :count).by(-1).and change(Address, :count).by(-1)
    end

    it "returns a success result" do
      expect(result.success?).to be(true)
    end
  end
end
