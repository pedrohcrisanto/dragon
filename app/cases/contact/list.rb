module Contact
  class List < Micro::Case
    attributes :user, :collection, :q

    def call!
      data = q.nil? ? collection : search

      Success result: { contacts: data }
    end

    private

    def search
      collection.where("name LIKE ?", "%#{q}%")
    end
  end
end
