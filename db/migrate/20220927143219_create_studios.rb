class CreateStudios < ActiveRecord::Migration[7.0]
  def change
    create_table :studios do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :address
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end
