require 'support/active_record'
require 'booklist/book'

module Booklist
  describe Book do
    it "requires a name" do
      subject.title = ""
      expect(subject).to have_at_least(1).error_on(:title)
      subject.title = "The Importance of Living"
      expect(subject).to be_valid
    end

    context "simple book" do
      let(:book) {
        Book.new do |b|
          b.title = "The Epic of Gilgamesh"
        end
      }

      it "has no author" do
        expect(book.author).to be_nil
      end
      it "has no additional authors" do
        expect(book.addn_authors).to be_nil
      end
      it "has no state" do
        expect(book.state).to be_nil
      end
      it "is a valid record" do
        expect(book).to be_valid
      end
    end

    context "complex book" do
      let(:book) {
        Book.new do |b|
          b.title = "Kareem"
          b.author = "Kareem Abdul-Jabbar"
          b.addn_authors = "Mignon McCarthy"
          b.state = "read"
          b.date_read = '2001-01-01'
        end
      }
      it "has an author" do
        expect(book.author).to eq "Kareem Abdul-Jabbar"
      end
      it "has an additional author" do
        expect(book.addn_authors).to eq "Mignon McCarthy"
      end
      it "has a state" do
        expect(book.state).to eq "read"
      end
      it "has a custom read date" do
        expect(book.date_read).to eq '2001-01-01'
      end
      it "is a valid record" do
        expect(book).to be_valid
      end
    end
  end
end
