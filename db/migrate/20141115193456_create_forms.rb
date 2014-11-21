class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.integer :employee_id
      t.string :ssn
      t.string :name
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.string :phone
      t.timestamps
    end
  end
end
