require "rails_helper"

RSpec.describe ::ContactList::Destroy, type: :case do
  subject(:result) do
    described_class.call(
      contact: contact,
      user: current_user
    )
  end
  let!(:current_user) { create(:user) }

  describe ".call" do
    let(:contact) { create(:contact, :with_address, user: current_user) }

    it "destroys the contact" do
      expect { result }.to change(Contact, :count).by(1)
    end

    it "returns a success result" do
      expect(result.success?).to be(true)
    end

    context "when user is diferent from the contact owner" do
      let(:current_user_owner) { create(:user) }
      let(:contact) { create(:contact, :with_address, user: current_user_owner) }

      it "returns a failure result" do
        expect(result.failure?).to be(true)
      end
    end
  end
end
