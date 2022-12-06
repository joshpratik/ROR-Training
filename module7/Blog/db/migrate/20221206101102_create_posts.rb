class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :post
      t.string :heading
      t.timestamps
    end
  end
end
