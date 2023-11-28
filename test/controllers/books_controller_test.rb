require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = Person.create!(name: 'test person')
    @book = books(:one)
    @county = County.first || County.create!(name: 'test county')
    @library = Library.create!(name: 'test library unique', address: 'test address unique', telephone: 'test telephone unique', county_id: @county.id)
    @valid_isbn = 'ISBN 978-0-596-52068-8'
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { isbn: @valid_isbn, person_id: @person.id, title: @book.title } }
    end

    unless Book.last.valid?
      puts Book.last.errors.full_messages
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { isbn: @valid_isbn, person_id: @person.id, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
