class AddDisplayPictureToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :display_picture_url, :string
    add_column :accounts, :name, :string
  end
end
