class CreateDanceClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :dance_classes do |t|
      t.string :country
      t.string :city
      t.string :studio
      t.string :address
      t.string :genre
      t.string :level
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :instructor
      t.integer :price
      t.string :url

      t.timestamps
    end
  end
end
