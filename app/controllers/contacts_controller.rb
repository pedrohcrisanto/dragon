class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: %i[show update destroy]

  def index
    result = ::ContactList::List.call(user: current_user,
                                      collection: contacts,
                                      q: params[:q])

    if result.success?
      render json: {
        contacts: ::ContactList::ContactBlueprint.render_as_json(result.data[:contacts]),
        pagination: {
          current_page: result.data[:contacts]&.current_page,
          total_pages: result.data[:contacts]&.total_pages,
          total_count: result.data[:contacts]&.total_entries
        }
      }, status: :ok
    else
      render json: result.data, status: :unprocessable_entity
    end
  end

  def show
    result = ::ContactList::Show.call(contact: @contact)

    if result.success?
      render json: ContactList::ContactBlueprint.render(result.data[:contact])
    else
      render json: result.data, status: :unprocessable_entity
    end
  end

  def create
    result = ::ContactList::Create.call(contact: contact_params[:contact],
                                        address: contact_params[:address],
                                        user: current_user)
    if result.success?
      render json: result.data, status: :created
    else
      render json: result.data, status: :unprocessable_entity
    end
  end

  def update
    result = ::ContactList::Update.call(contact: contact_params[:contact],
                                        address: contact_params[:address],
                                        id: contact_params[:id])

    if result.success?
      render json: ::ContactList::ContactBlueprint.render(result.data[:contact]), message: result.data[:message]
    else
      render json: result.data, status: :unprocessable_entity
    end
  end

  def destroy
    result = ::ContactList::Destroy.call(contact: @contact, user: current_user)

    if result.success?
      render json: result.data, status: :ok
    else
      render json: result.data, status: :unprocessable_entity
    end
  end

  def search_address
    result = ::ContactList::SearchAddress.call(zip_code: contact_params[:zip_code])

    if result.success?
      render json: result.data
    else
      render json: result.data, status: :unprocessable_entity
    end
  end

  private

  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end

  def contacts
    @contacts ||= current_user.contacts
                              .includes(:address)
                              .order(:name)
                              .paginate(page: contact_params[:page],
                                        per_page: contact_params[:per_page])
  end

  def contact_params
    params.permit(:q, :zip_code, :page, :per_page, :id,
                  contact: [ :name, :cpf, :cellphone, :user_id ],
                  address: [ :street, :city, :state, :zip_code,
                             :number, :complement, :country ])
  end
end
