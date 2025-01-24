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
      security [ cookie: [] ]
      consumes 'application/json'
      parameter name: :contacts, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          cpf: { type: :string },
          cellphone: { type: :string }
        },
        required: [ 'cpf', 'name', 'cellphone' ],
        address: {
          type: :object,
          properties: {
            street: { type: :string },
            city: { type: :string },
            state: { type: :string },
            zip_code: { type: :string },
            number: { type: :string },
            country: { type: :string }
          },
          required: [ 'street', 'city', 'state', 'zip_code', 'number', 'country' ]
        }
      }

      response '201', 'contact created' do
        let(:contacts) do
          { contact: { name: 'foo', cpf: '12345678901', cellphone: '12345678901' },
            address: { street: 'foo', city: 'foo', state: 'foo', zip_code: '12345678', number: '12345678', country: 'foo' }
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:contacts) {  }

        run_test!
      end
    end
  end

  path '/contacts/{id}' do
    put 'Updates a contact' do
      tags 'Contacts'
      security [ cookie: [] ]
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :contacts, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          cpf: { type: :string },
          cellphone: { type: :string }
        },
        required: [ 'cpf', 'name', 'cellphone' ],
        address: {
          type: :object,
          properties: {
            street: { type: :string },
            city: { type: :string },
            state: { type: :string },
            zip_code: { type: :string },
            number: { type: :string },
            country: { type: :string }
          },
          required: [ 'street', 'city', 'state', 'zip_code', 'number', 'country' ]
        }
      }
      response '200', 'contact updated' do
        let(:id) { create(:contact, :with_address, user: user).id }
        let(:contacts) do
          { contact: { name: 'foo', cpf: '12345678901', cellphone: '12345678901' },
            address: { street: 'foo', city: 'foo', state: 'foo', zip_code: '12345678', number: '12345678', country: 'foo' }
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { create(:contact, user: user).id }
        let(:contacts) {  }

        run_test!
      end
    end
  end

  path '/contacts/{id}' do
    delete 'Deletes a contact' do
      tags 'Contacts'
      security [ cookie: [] ]
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'contact deleted' do
        let(:id) { create(:contact, :with_address, user: user).id }
        run_test!
      end
    end
  end

  path '/search_address' do
    get 'Searches an address' do
      tags 'Contacts'
      security [ cookie: [] ]
      consumes 'application/json'
      parameter name: :zip_code, in: :query, type: :string
      response '200', 'address found' do
        let(:zip_code) { '58038-491' }
        run_test!
      end

      response '422', 'invalid request' do
        let(:zip_code) { '12345678' }
        run_test!
      end
    end
  end

  path '/contacts' do
    get 'Retrieves all contacts' do
      tags 'Contacts'
      security [ cookie: [] ]
      consumes 'application/json'
      response '200', 'contacts found' do
        let(:contacts) { create_list(:contact, :with_address, 10, user: user) }
        run_test!
      end
    end
  end

  path "/contacts/{id}" do
    get "Retrieves a contact" do
      tags "Contacts"
      security [ cookie: [] ]
      consumes "application/json"
      parameter name: :id, in: :path, type: :string
      response "200", "contact found" do
        let(:id) { create(:contact, :with_address, user: user).id }
        run_test!
      end
    end
  end
end
