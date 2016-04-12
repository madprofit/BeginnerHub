class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.string :when
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
