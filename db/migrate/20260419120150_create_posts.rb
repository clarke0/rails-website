class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :body, null: false
      t.datetime :published_at
      t.index :slug, unique: true

      t.timestamps
    end
  end
end
