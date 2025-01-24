module ContactList
  class List < Micro::Case
    attributes :user, :collection, :q

    def call!
      Success result: { contacts: list }
    end

    private

    def list
      return collection&.where("name LIKE ? OR cpf LIKE ?", "%#{q}%", "%#{q}%") if q.present?
      collection if collection.present?

      []
    end
  end
end
