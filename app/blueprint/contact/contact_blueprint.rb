module Contact
  class ContactBlueprint < Blueprinter::Base
    identifier :id

    fields :name, :cellphone, :cpf

    association :address, blueprint: Address::AddressBlueprint
  end
end