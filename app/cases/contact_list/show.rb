module ContactList
  class Show < Micro::Case
    attributes :contact

    def call!
      if contact
        Success result: { contact: contact }
      else
        Failure result: { message: "Contato não encontrado!" }
      end
    end
  end
end
