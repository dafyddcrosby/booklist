class Initial < ActiveRecord::Migration
  def up
    connection.create_table :books do |t|
      t.string :title, :author, :addn_authors, :state
      t.timestamp :date_read
      t.text :notes
      t.timestamps
    end

    connection.create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    connection.create_table :taggings do |t|
      t.belongs_to :tag, :book
    end
  end
end
