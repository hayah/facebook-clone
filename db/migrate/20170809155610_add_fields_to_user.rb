class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birthdate, :date
    add_column :users, :city, :string
    add_column :users, :gender, :integer
    add_column :users, :bio, :text
  end
end
