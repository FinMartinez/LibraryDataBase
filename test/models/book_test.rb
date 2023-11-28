require "test_helper"

class BookTest < ActiveSupport::TestCase
  fixtures :people, :counties, :libraries, :books, :books_libraries
  
  test 'good book' do
    book = Book.create!(
      person: Person.create!(name: 'The Author'),
      title: 'The Great Gatsby', 
      isbn: 'ISBN 978-0-306-40615-7')
    assert book.valid?
  end

  test 'title too short' do
    exception = assert_raise(ActiveRecord::RecordInvalid) {
      book = Book.create!(
        person: Person.create!(name: 'The Author'),
        title: '', 
        isbn: 'ISBN 978-0-306-40615-7')
    }
    puts exception.message
    assert_equal("Validation failed: Title is too short (minimum is 1 character)", exception.message)
  end

  test 'title too long' do
    exception = assert_raise(ActiveRecord::RecordInvalid) {
      book = Book.create!(
        person: Person.create!(name: 'The Author'),
        title: 'x' * 256,
        isbn: 'ISBN 978-0-306-40615-7')
    }
    puts exception.message
    assert_equal("Validation failed: Title is too long (maximum is 250 characters)", exception.message)
  end

  test 'missing person' do
    exception = assert_raise(ActiveRecord::RecordInvalid) {
      book = Book.create!( 
        title: 'The Great Gatsby',
        isbn: 'ISBN 978-0-306-40615-7')
    }
    puts exception.message
    assert_equal("Validation failed: Person must exist, Person can't be blank", exception.message)
  end

  test 'bad isbn' do
    exception = assert_raise(ActiveRecord::RecordInvalid) {
      book = Book.create!(
        person: Person.create!(name: 'The Author'),
        title: 'The Great Gatsby',
        isbn: 'ISBN 978-0-306-40615')
    }
    puts exception.message
    assert_equal("Validation failed: Isbn must be in the format ISBN 000-0-000-0000-0", exception.message)
  end

  
end
