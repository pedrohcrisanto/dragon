module ContactList
  class Create < Micro::Case
    attributes :contact, :address, :user

    def call!
      if create_contact_address
        Success result: { message: "Contato criado com sucesso!" }
      else
        Failure result: { message: "Não foi possivel salvar o contato!" }
      end
    rescue => e
      Failure result: { message: "Não foi possivel salvar o contato!", error: e }
    end

    private

    def create_contact_address
      ActiveRecord::Base.transaction do
        created_contact = create_contact
        new_address(contact: created_contact).save!
      end
    end

    def create_contact
     Contact.create!(name: contact[:name],
                    cpf: contact[:cpf],
                    cellphone: contact[:cellphone],
                    user_id: user.id)
    end

    def new_address(contact:)
      Address.new(street: address[:street],
                  city: address[:city],
                  state: address[:state],
                  zip_code: address[:zip_code],
                  number: address[:number],
                  country: address[:country],
                  complement: address[:complement],
                  contact_id: contact.id)
    end
  end
end
