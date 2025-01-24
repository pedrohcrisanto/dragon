module ContactList
  class List < Micro::Case
    attributes :user, :collection, :q

    def call!
      data = q.nil? ? collection : search

      Success result: { contacts: data }
    end

    private

    def search
      collection.where("name LIKE ? OR cpf LIKE ?", "%#{q}%", "%#{q}%")
    end
  end
end
