class AddIndexToAdjustmentsKind < ActiveRecord::Migration[5.2]
  def change
    add_index :adjustments, :kind
  end
end
