class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.belongs_to :project
      t.text :title
      t.text :description
      t.string :uid
      t.text :issue_url
      t.timestamps
    end
  end
end
