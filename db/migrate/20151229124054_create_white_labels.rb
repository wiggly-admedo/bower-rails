class CreateWhiteLabels < ActiveRecord::Migration
  def change
    create_table :white_labels do |t|
      t.string :name
      t.string :domain
      t.string :background
      t.timestamps null: false
    end
  end
end
