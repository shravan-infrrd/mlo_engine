class CreateMloCounties < ActiveRecord::Migration[5.1]
  def change
    create_table :mlo_counties do |t|
      t.string :county_name, default: ""
      t.integer :state_id

      t.timestamps
    end
  end
end
