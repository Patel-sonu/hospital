class AddEmailAndPasswordToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :email, :string
    add_column :doctors, :password, :string
    add_column :doctors, :password_confirmation, :string
  end
end
