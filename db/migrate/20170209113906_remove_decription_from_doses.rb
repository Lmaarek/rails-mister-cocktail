class RemoveDecriptionFromDoses < ActiveRecord::Migration[5.0]
  def change
    remove_column :doses, :decription, :string
  end
end
