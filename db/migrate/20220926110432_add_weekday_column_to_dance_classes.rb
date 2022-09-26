class AddWeekdayColumnToDanceClasses < ActiveRecord::Migration[7.0]
  def change
    add_column :dance_classes, :weekday, :integer
    remove_column :dance_classes, :date
  end
end
