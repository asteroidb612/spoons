class AddNameToTournamentsAndRounds < ActiveRecord::Migration
  def change
    change_table :rounds do |t|
      t.string :name
    end
    change_table :tournaments do |t|
      t.string :name
    end
  end
end
