# frozen_string_literal: true

require 'forwardable'

# The list of book
class BookList
  extend Forwardable
  def_delegator :@books, :each, :each_book

  def initialize(books = [])
    @books = books
  end

  def add_book(book)
    @books.append(book)
  end

  def all_books
    @books.sort_by(&:date).reverse
  end

  def years
    years = []
    @books.each do |book|
      book_date = Date.parse(book.date)
      years.append(book_date.strftime('%Y')) unless years.include?(book_date.strftime('%Y'))
    end
    years.sort.reverse
  end

  def months(year)
    months = Array.new(12, 0)
    @books.each do |book|
      book_date = Date.parse(book.date)
      months[book_date.strftime('%-m').to_i - 1] += 1 if book_date.strftime('%Y') == year.to_s
    end
    months
  end
end
