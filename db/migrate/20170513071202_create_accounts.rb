class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.belongs_to :project, index: true
      t.string :uid, null: false
      t.text :keywords
      t.integer :kind, null: false
      t.timestamps
    end
  end
end
