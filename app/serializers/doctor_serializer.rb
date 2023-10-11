class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :specialization, :email, :password, :password_confirmation
  # # attributes :name do |object|
  # #   byebug
  # end
end
