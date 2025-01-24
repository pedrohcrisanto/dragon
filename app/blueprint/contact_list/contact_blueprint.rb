module ContactList
  class ContactBlueprint < Blueprinter::Base
    identifier :id

    fields :name, :cellphone, :cpf

    association :address, blueprint: ::AddressBlueprint
  end
end
