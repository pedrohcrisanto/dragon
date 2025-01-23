module ContactList
  class Show < Micro::Case
    attributes :contact

    def call!
      Success result: { contact: contact }
    end
  end
end