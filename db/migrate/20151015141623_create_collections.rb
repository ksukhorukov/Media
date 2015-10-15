class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.belongs_to :user
    end
  end
end
