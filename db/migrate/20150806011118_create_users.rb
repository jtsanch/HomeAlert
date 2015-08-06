class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :login
      t.string :password
      t.string :salt

      t.timestamps null: false
    end
  end
end
