require 'rails_helper'

RSpec.describe ::ContactList::List, type: :case do
  subject(:result) do
    described_class.call(
      user: current_user,
      collection: current_user.contacts,
      q: query
    )
  end

  describe '.call' do
    let(:current_user) { create(:user) }

    context 'when the query is nil' do
      let(:query) { nil }

      it 'returns all contacts' do
        expect(result.data[:contacts]).to eq(current_user.contacts)
      end
    end

    context 'when the query is present' do
      let(:query) { 'John' }

      it 'returns the contacts that match the query' do
        expect(result.data[:contacts]).to eq(Contact.where('name LIKE ?', '%John%'))
      end
    end
  end
end