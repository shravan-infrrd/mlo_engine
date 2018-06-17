class CreateMloStates < ActiveRecord::Migration[5.1]
  def change
    create_table :mlo_states do |t|
      t.string :state_name, default: ""
      t.string :state_code, default: ""

      t.timestamps
    end
  end
end
