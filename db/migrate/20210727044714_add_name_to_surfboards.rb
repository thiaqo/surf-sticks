class AddNameToSurfboards < ActiveRecord::Migration[6.0]
  def change
    add_column :surfboards, :name, :string
  end
end
