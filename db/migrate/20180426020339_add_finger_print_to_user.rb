class AddFingerPrintToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fingerprint, :string
  end
end
