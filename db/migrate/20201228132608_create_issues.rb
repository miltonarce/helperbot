class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.string :html_url
      t.integer :id_github
      t.integer :number
      t.string :state
      t.string :title
      t.integer :comments
      t.date :closed_at
      t.text :body

      t.timestamps
    end
  end
end
