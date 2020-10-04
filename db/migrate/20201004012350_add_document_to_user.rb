class AddDocumentToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :document, :string
    add_column :users, :phone, :string
    add_column :users, :status, :boolean
  end
end
