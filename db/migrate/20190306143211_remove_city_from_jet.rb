class RemoveCityFromJet < ActiveRecord::Migration[5.2]
  def change
    remove_column :jets, :city
  end
end
