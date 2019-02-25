class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :performer
      t.string :notes

      t.timestamps
    end
  end
end
