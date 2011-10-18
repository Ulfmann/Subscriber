class AddBetatestToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :betatest, :boolean
  end
end
