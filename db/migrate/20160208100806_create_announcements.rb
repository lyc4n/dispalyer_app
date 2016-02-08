class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.text :content
      t.text :marquee
      t.string :foreground
      t.string :background
      t.string :key

      t.timestamps
    end
  end
end
