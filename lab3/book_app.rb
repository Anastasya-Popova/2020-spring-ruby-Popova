# frozen_string_literal: true

require 'roda'
require_relative 'models'

# The core class of the web application for reader's Book
class BookApp < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :render

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  opts[:books] = BookList.new([
                                Book.new('William Shakespeare',
                                         'The Tragedy of Romeo and Juliet',
                                         '2016-04-05'),
                                Book.new('Jonathan Swift',
                                         'Gulliver travels',
                                         '2006-02-17'),
                                Book.new('Jerome K. Jerome',
                                         'Three Men in a Boat',
                                         '2012-08-10'),
                                Book.new('Arthur Conan Doyle',
                                         'The Adventure of Sherlock Holmes',
                                         '2012-06-11')
                              ])

  route do |r|
    r.public if opts[:serve_static]

    r.root do
      @params = InputValidators.check_book(r.params['autor'],
                                           r.params['title'],
                                           r.params['date'])
      @list_books = opts[:books].all_books
      view('books')
    end

    r.on 'new' do
      r.get do
        view('new_book')
      end

      r.post do
        @params = InputValidators.check_book(r.params['autor'], r.params['title'], r.params['date'])
        if @params[:errors].empty?
          opts[:books].add_book(Book.new(@params[:autor], @params[:title], @params[:date]))
          r.redirect '/'
        else
          view('new_book')
        end
      end
    end

    r.on 'statistics' do
      @list_books = opts[:books].all_books
      @list_years = opts[:books].years
      @this_year = r.params['year']
      @list_months = opts[:books].months(@this_year)
      @months_names = %w[jan feb mar apr may jun jul aug sep oct nov dec]
      view('show_statistics')
    end
  end
end
