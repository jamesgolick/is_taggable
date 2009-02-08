class IsTaggableMigration < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name, :default => ''
      t.string :kind, :default => '' 
    end

    create_table :taggings do |t|
      t.integer :tag_id

      t.string  :taggable_type, :default => ''
      t.integer :taggable_id
    end
    
    add_index :tags,     [:name, :kind]
    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type]
  end
  
  def self.down
    drop_table :taggings
    drop_table :tags
  end
end
