class CreateHostels < ActiveRecord::Migration
  def change
    create_table :hostels do |t|
      t.string :name
      t.string :email
      t.string :address
      t.integer :city_id
      t.string :phone
      t.string :description
      t.string :photo_string

      t.timestamps
    end
  end
end
