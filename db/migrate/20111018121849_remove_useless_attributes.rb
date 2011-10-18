class RemoveUselessAttributes < ActiveRecord::Migration
  def up
    remove_column :recipients, :name
    remove_column :recipients, :notice
  end

  def down
    add_column :recipients, :name  , :string
    add_column :recipients, :notice, :text
  end
end
