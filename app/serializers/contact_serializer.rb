class ContactSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :cpf, :cellphone
end
