class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :ein
      t.string :name
      t.integer :user_id
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.string :address_zip
    end
  end
end
