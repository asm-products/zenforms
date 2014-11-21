class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.integer :employee_id
      t.string :token
      t.string :job_id
      t.timestamps
    end
  end
end
