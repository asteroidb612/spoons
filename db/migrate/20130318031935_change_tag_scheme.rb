class ChangeTagScheme < ActiveRecord::Migration
  def change
    if column_exists? :tags, :tagger_id
      remove_column :tags, :tagger_id
    end
    if column_exists? :tags, :tagged_id
      remove_column :tags, :tagged_id
    end
    if column_exists? :tags, :player_id
      remove_column :tags, :player_id
    end
    change_table :tags do |t|
      t.integer :tagger_id
      t.integer :tagged_id
    end
  end
end
