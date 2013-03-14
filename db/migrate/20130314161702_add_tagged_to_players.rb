class AddTaggedToPlayers < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.boolean :tagged
    end
  end
end
