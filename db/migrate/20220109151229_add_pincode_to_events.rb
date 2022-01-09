class AddPincodeToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :pincode, :string
  end
end
