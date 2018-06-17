class CreateMloCities < ActiveRecord::Migration[5.1]
  def change
    create_table :mlo_cities do |t|
      t.string :city_name, default: ""
      t.string :zipcode, default: ""
      t.integer :county_id

      t.timestamps
    end
  end
end
