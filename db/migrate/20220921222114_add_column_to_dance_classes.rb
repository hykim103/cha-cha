class AddColumnToDanceClasses < ActiveRecord::Migration[7.0]
  def change
    add_column :dance_classes, :image_url, :string
  end
end
