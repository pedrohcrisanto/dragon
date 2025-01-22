module Contact
  class Destroy < Micro::Case
    attributes :contact

    def call!
      if contact.destroy
        Success result: { message: "Contato deletado com sucesso!" }
      else
        Failure result: { message: "Não foi possivel deletar o contato!" }
      end
    end
  end
end