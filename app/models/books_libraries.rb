class BooksLibraries < ActiveRecord::Base
  belongs_to :book  # foreign key - book_id
  belongs_to :library # foreign key - library_id
end
