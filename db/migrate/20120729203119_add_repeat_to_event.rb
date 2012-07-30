class AddRepeatToEvent < ActiveRecord::Migration
  def change
    add_column :events, :repeat, :integer, null: false, :default => 0
  end
end
