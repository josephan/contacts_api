class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
