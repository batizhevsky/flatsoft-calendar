class AddRepeatToEvent < ActiveRecord::Migration
  def change
    add_column :events, :repeat, :integer
  end
end
