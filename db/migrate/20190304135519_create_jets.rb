class CreateJets < ActiveRecord::Migration[5.2]
  def change
    create_table :jets do |t|
      t.string :name
      t.text :description
      t.integer :price_day
      t.integer :pax
      t.string :city
      t.string :address
      t.string :zipcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
