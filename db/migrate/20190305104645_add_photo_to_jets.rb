class AddPhotoToJets < ActiveRecord::Migration[5.2]
  def change
    add_column :jets, :photo, :string
  end
end
