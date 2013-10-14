module Booklist
  class Tag < ActiveRecord::Base
    has_many :taggings
    has_many :books, through: :taggings #, source: "tag_id"
  end

  class Tagging < ActiveRecord::Base
    belongs_to :tag
    belongs_to :book
  end
end
