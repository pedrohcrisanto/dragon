require "rails_helper"

RSpec.describe ::ContactList::Show, type: :case do
  subject(:result) do
    described_class.call(contact: contact)
  end
  let(:contact) { create(:contact, :with_address) }

  describe ".call" do
    context "when the contact is valid" do
      it "returns a success result" do
        expect(result.success?).to be(true)
      end
    end

    context "when the contact is invalid" do
      let(:contact) { nil }

      it "returns a failure result" do
        expect(result.failure?).to be(true)
      end
    end
  end
end
