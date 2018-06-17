class CreateMloCountyUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :mlo_county_users do |t|
      t.integer :user_id
      t.integer :county_id

      t.timestamps
    end
  end
end
