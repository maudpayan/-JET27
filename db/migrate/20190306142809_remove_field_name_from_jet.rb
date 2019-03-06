class RemoveFieldNameFromJet < ActiveRecord::Migration[5.2]
  def change
    remove_column :jets, :zipcode
  end
end
