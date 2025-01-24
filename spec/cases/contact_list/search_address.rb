require "rails_helper"
RSpec.describe ::ContactList::SearchAddress, type: :case do
  subject(:result) do
    described_class.call(
      zip_code: zip_code
    )
  end

  describe ".call" do
    context "when the zip code is valid" do
      let(:zip_code) { "58102222" }

      it "returns a success result" do
        expect(result.success?).to be(true)
      end
    end

    context "when the zip code is invalid" do
      let(:zip_code) { "00000" }

      it "returns a failure result" do
        expect(result.failure?).to be(true)
      end
    end
  end
end
