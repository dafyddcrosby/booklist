require 'booklist/version'
require 'booklist/book'
require 'booklist/tag'

module Booklist
  def self.add_book(options)
    if !options.title || options.title == ""
      puts "Please add a --title with the book name"
      puts usage
      exit
    end
    book = Book.new do |b|
      b.title = options.title
      b.author = options.author if options.author
      b.addn_authors = options.addn_authors if options.addn_authors
      b.state = options.state if options.state
      b.date_read = options.date_read if options.date_read
      b.tag_list = options.tags if options.tags
    end
    book.save
    book.cli_display
  end

  def self.edit_book(options)
    book = Book.find_by(id: options.id)
    if book
      book.title = options.title if options.title
      book.author = options.author if options.author
      book.addn_authors = options.addn_authors if options.addn_authors
      book.state = options.state if options.state
      book.date_read = options.date_read if options.date_read
      book.tag_list = options.tags if options.tags
      book.save
      book.cli_display
    else
      puts "No book with ID of #{options.id} was found"
    end
  end

  def self.read_book(id)
    book = Book.find_by(id: id)
    if book
      book.cli_display
    else
      puts "No book with ID of #{id} was found"
    end
  end

  def self.search_books(options)
    books = []
    books += Book.where(["title LIKE ?", "%#{options.title}%"]).to_a if options.title
    books += Book.where(["author LIKE ? or addn_authors LIKE ?", "%#{options.author}%", "%#{options.author}%"]).to_a if options.author
    books += Book.where(["author LIKE ? or addn_authors LIKE ?", "%#{options.addn_authors}%", "%#{options.addn_authors}%"]).to_a if options.addn_authors
    books += Book.where(["state = ?", "%#{options.state}%"]).to_a if options.state
    books.uniq!
    books.sort!{ |a, b| a.id <=> b.id}
    books.select!{ |b| b.state == options.state} if options.state
    books.each { |b| b.cli_display }
  end

  def self.delete_book(id)
    book = Book.find_by(id: id)
    book.destroy
  end

  def self.list_books
    books =Book.all
    books.each{ |b| b.cli_display }
  end

end
