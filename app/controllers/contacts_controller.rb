class ContactsController < ApplicationController
  #before_action :set_contact, only: %i[ show update destroy ]
  before_action :authenticate_user!

  def index
    result = ::Contact::List.call(user: current_user,
                                  collection: collection,
                                  q: params[:q])

    if result.success?
      render json: Contact::ContactBlueprint.render(result.data),  status: :ok
    else
      render json: result.data, status: :unprocessable_entity
    end

    def show
      result = ::Contact::Show.call(contact: @contact)

      if result.success?
        render json: Contact::ContactBlueprint.render(result.data)
      else
        render json: result.data, status: :unprocessable_entity
      end
    end

    def create
      result = ::Contact::Create.call(contact: contact_params[:contact],
                                      address: contact_params[:address],
                                      user: current_user)
      if result.success?
        render json: result.data, status: :created
      else
        render json: result.data, status: :unprocessable_entity
      end
    end

    def update
      result = ::Contact::Update.call(contact: @contact, params: contact_params)

      if result.success?
        render json: Contact::ContactBlueprint.render(result.data)
      else
        render json: result.data, status: :unprocessable_entity
      end
    end

    def destroy
      @contact.destroy!
    end

    def search_address
      result = ::Viacep::SearchAddress.call(zip_code: contact_params[:zipcode])

      if result.success?
        render json: result.data
      else
        render json: result.data, status: :unprocessable_entity
      end
    end

    private

    def set_contact
      @contact = Contact.find(params.expect(:id))
    end

    def collection
      current_user.contacts.includes(:address).order(:name)
    end

    def contact_params
      params.permit(:q, :zip_code, :page, :per_page,
                    contact: [ :name, :cpf, :cellphone, :user_id ],
                    address: [ :street, :city, :state, :zip_code,
                               :number, :complement ])
    end
  end
end
