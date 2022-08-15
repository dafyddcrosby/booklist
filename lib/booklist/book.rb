module Booklist
  class Book < ActiveRecord::Base
    has_many :taggings
    has_many :tags, through: :taggings # , source: "book_id"
    validates :title, presence: true

    def cli_display
      puts "ID: #{id}\n"
      puts "Title: #{title}\n"
      puts "Author: #{author}\n" if author
      puts "Additional authors: #{addn_authors}" if addn_authors
      puts "State: #{state}" if state
      puts "Date Read: #{date_read.to_date}" if date_read
      puts "Tags: #{tag_list}\n" if tags.count > 0
      puts "\n"
    end

    def tag_list
      # put tags
      tags.map(&:name).join(", ")
    end

    def tag_list=(names)
      self.tags = names.map do |n|
        Tag.where(name: n.strip).first_or_create!
      end
    end
  end
end
