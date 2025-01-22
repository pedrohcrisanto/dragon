module Contact
  class Update < Micro::Case
    attributes :contact, :address

    def call!
      if update_contact_address
        Success result: { contact: contact }
      else
        Failure result: { message: "Não foi possivel atualizar o contato!" }
      end
    end

    def update_contact_address
      ActiveRecord::Base.transaction do
        update_contact
        update_address
      end
    end

    def update_address
      ActiveRecord::Base.transaction do
        contact.address.update(params[:address])
      end
    end

    def update_contact
      contact.update(params[:contact])
    end
  end
end
