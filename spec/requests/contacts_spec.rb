# spec/requests/blogs_spec.rb
require 'swagger_helper'

describe 'Contacts API' do
  before do
    sign_in user
  end
  let(:user) { create(:user) }

  path '/contacts' do

    post 'Creates a contact' do
      tags 'Contacts'
      security [cookie: []]
      consumes 'application/json'
      parameter name: :contact, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          cpf: { type: :string },
          cellphone: { type: :string }
        },
        required: [ 'cpf', 'name' ]
      }

      response '201', 'contact created' do
        let(:contact) do
          { contact: { name: 'foo', cpf: '12345678901', cellphone: '12345678901' },
            address: { street: 'foo', city: 'foo', state: 'foo', zip_code: '12345678', number: '123', complement: 'foo' } }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:contact) {  }

        run_test!
      end
    end


  end
end
