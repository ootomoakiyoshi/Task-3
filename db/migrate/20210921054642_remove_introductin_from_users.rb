class RemoveIntroductinFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :introductin, :string
  end
end
