class AddAddressToSurfboards < ActiveRecord::Migration[6.0]
  def change
    add_column :surfboards, :address, :string
  end
end
