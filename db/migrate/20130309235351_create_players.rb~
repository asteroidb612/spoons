class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :password
      t.string :secret
      t.integer :tags
      t.boolean :tagged
      t.integer :year

      t.timestamps
    end
  end
end
