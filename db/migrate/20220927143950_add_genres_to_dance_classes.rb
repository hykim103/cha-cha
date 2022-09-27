class AddGenresToDanceClasses < ActiveRecord::Migration[7.0]
  def change
    add_reference :dance_classes, :genre, null: false, foreign_key: true
  end
end
