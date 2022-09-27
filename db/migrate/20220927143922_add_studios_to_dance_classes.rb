class AddStudiosToDanceClasses < ActiveRecord::Migration[7.0]
  def change
    add_reference :dance_classes, :studio, null: false, foreign_key: true
  end
end
