class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :kind

      t.timestamps
    end
  end
end
