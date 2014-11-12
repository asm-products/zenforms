class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :email_address
      t.integer :payment_amount
      t.integer :company_id

      t.timestamps
    end
  end
end
