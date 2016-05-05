class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :content, null: false
      t.integer :author_id, null: false
      t.integer :appointment_id, null: false

      t.timestamps null: false
    end
  end
end
