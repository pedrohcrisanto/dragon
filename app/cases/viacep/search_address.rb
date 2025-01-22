module Viacep
  class SearchAddress < Micro::Case
    attributes :zip_code

    def call!
      Success result: { address: address }

      rescue
        Failure result: { message: "Não foi possivel encontrar o endereço!" }
    end

    private

    def search
      @search |= ViaCep::Address.new(zipcode)
    end

    def address
      {
        street: search.address,
        city: search.city,
        state: search.state
      }
    end
  end
end
