class AddTaggedToPlayers < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.boolean :tagged, default: false
    end
  end
end
