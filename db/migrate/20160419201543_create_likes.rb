class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :secret, index: true, foreign_key: true

      t.timestamps
    end
  end
end
