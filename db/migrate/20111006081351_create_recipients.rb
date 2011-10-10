class CreateRecipients < ActiveRecord::Migration
  def self.up
    create_table :recipients do |t|
      t.string :name
      t.string :email
      t.text :notice

      t.timestamps
    end
  end

  def self.down
    drop_table :recipients
  end
end
