class CreateAdjustments < ActiveRecord::Migration[5.2]
  def change
    create_table :adjustments do |t|
      t.integer :value
      t.string :name
      t.string :kind

      t.timestamps
    end
  end
end
