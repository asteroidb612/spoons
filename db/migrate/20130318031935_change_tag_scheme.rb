class ChangeTagScheme < ActiveRecord::Migration
  def change
    remove_column :tags, :tagger_id
    remove_column :tags, :tagged_id
    remove_column :tags, :player_id
    change_table :tags do |t|
      t.integer :tagger_id
      t.integer :tagged_id
    end
  end
end
