module ContactList
  class List < Micro::Case
    attributes :collection, :q

    def call!
      Success result: { contacts: list }
    end

    private

    def list
      return collection&.where("name LIKE ? OR cpf LIKE ?", "%#{q}%", "%#{q}%") if q.present?
      return collection if collection.present?

      []
    end
  end
end
