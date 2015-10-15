class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :video
      t.string :image
      t.string :url
      t.boolean :public, default: false
      t.timestamps null: false
      
      t.belongs_to :type
      t.belongs_to :user
      t.belongs_to :collection
    end
  end
end
