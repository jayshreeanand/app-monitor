class AddTrelloBoardIdToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :trello_board_uid, :string
  end
end
