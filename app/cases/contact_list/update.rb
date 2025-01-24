module ContactList
  class Update < Micro::Case
    attributes :contact, :address, :id

    def call!
      if update_contact_address
        Success result: { contact: set_contact, message: "Contato Atualizado com sucesso!" }
      else
        Failure result: { message: "Não foi possivel atualizar o contato!" }
      end
    rescue => e
      Failure result: { message: e.message }
    end

    private

    def update_contact_address
      ActiveRecord::Base.transaction do
        update_contact
        update_address
      end
    end

    def update_address
      ActiveRecord::Base.transaction do
        set_contact.address.update!(address)
      end
    end

    def set_contact
      @set_contact ||= Contact.find(id)
    end

    def update_contact
      set_contact.update!(contact)
    end
  end
end
