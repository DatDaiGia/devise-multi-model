class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :user_name
      t.string :password

      t.timestamps null: false
    end
  end
end
