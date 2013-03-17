class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.datetime :timestamp
      t.references :tagger, Player
      
      t.timestamps
    end
  end
end
