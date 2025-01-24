module ContactList
  class Destroy < Micro::Case
    attributes :contact

    def call!
      if destroy_contact
        Success result: { message: "Contato deletado com sucesso!" }
      else
        Failure result: { message: "Não foi possivel deletar o contato!" }
      end
    end

    private

    def destroy_contact
      contact.destroy!
    end
  end
end
