class AddTargetToPlayers < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.references :target
    end
  end
end
