class AddColumnsToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :title, :string
    add_column :messages, :start_date, :date
    add_column :messages, :end_date, :date
  end
end
