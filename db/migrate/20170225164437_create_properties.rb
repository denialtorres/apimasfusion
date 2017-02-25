class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :type
      t.string :title
      t.string :address
      t.string :zipcode
      t.string :country
      t.text :notes

      t.timestamps null: false
    end
  end
end
