class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :secret
      t.references :game
      t.integer :year

      t.timestamps
    end
  end
end
