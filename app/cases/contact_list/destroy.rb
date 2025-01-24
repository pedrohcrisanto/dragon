module ContactList
  class Destroy < Micro::Case
    attributes :contact, :user

    def call!
      return Failure result: { message: "Voce não pode deletar este contato!" } unless check_user

      destroy_contact

      Success result: { message: "Contato deletado com sucesso!" }
    rescue => e
      Failure result: { message: "Não foi possivel deletar o contato!", error: e }
    end

    private

    def destroy_contact
      if contact.user_id == user.id
        contact.address&.destroy!
        contact.destroy!
      end
    end

    def check_user
      contact.user_id == user.id
    end
  end
end
