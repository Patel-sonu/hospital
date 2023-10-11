class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :city
  attributes :name do |object|
    byebug
  end
end
