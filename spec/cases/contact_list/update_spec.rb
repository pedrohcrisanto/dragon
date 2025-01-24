require "rails_helper"

RSpec.describe ::ContactList::Update do
  subject(:result) do
    described_class.call(
      contact: contact_params[:contact],
      address: contact_params[:address],
      user: current_user,
      id: contact.id
    )
  end
  let(:contact) { create(:contact, :with_address) }

  describe ".call" do
    context "when the contact and address are valid" do
      let(:contact_params) do
        {
          contact: {
            name: "John Doe",
            cpf: "123.456.789-00",
            cellphone: "(11) 99999-9999"
          },
          address: {
            street: "Main Street",
            city: "Springfield",
            state: "IL",
            zip_code: "62701",
            number: "123",
            country: "USA"
          }
        }
      end
      let(:current_user) { create(:user) }

      it "returns a success result" do
        expect(result.success?).to be(true)
      end
    end

    context "when the contact is invalid" do
      let(:contact_params) do
        {
          contact: {
            name: nil,
            cpf: nil,
            cellphone: nil
          },
          address: {
            street: "Main Street",
            city: "Springfield",
            state: "IL",
            zip_code: "62701",
            number: "123"
          }
        }
      end
      let(:current_user) { create(:user) }

      it "returns a failure result" do
        expect(result.failure?).to be(true)
      end
    end

    context "when the address is nil" do
      let(:contact_params) do
        {
          contact: {
            name: "John Doe",
            cpf: "123.456.789-00",
            cellphone: "(11) 99999-9999"
          },
          address: {
            street: nil,
            city: nil,
            state: nil,
            zip_code: nil,
            number: nil
          }
        }
      end
      let(:current_user) { create(:user) }

      it "returns a failure result" do
        expect(result.failure?).to be(true)
      end
    end
  end
end
