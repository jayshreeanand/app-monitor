class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
