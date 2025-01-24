module ContactList
  class Destroy < Micro::Case
    attributes :contact

    def call!
      if destroy_contact
        Success result: { message: "Contato deletado com sucesso!" }
      else
        Failure result: { message: "Não foi possivel deletar o contato!" }
      end
    rescue => e
      Failure result: { message: "Não foi possivel deletar o contato!", error: e }
    end

    private

    def destroy_contact
      contact.address&.destroy!
      contact.destroy!
    end
  end
end
