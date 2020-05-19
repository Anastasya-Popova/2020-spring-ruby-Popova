
require 'roda'
require_relative 'models'

# The core class of the web application for managing tests
class TestApp < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :render

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  opts[:tests] = TestList.new([
    Test.new('lab 1', '2020-04-05', 'proverka Ruby'),
    Test.new('lab 2', '2020-04-20', 'proverishe Ruby'),
    Test.new('exam', '2020-06-20', 'all proverka')
                              ])

  route do |r|
    r.public if opts[:serve_static]

    r.root do
      'Hello, world!'
    end


    r.on 'tests' do
      r.is do
        @params = InputValidators.check_date_description(r.params['date'], r.params['description'])
        @filtered_tests = if @params[:errors].empty?
                            opts[:tests].filter(@params[:date], @params[:description])
                          else
                            opts[:tests].all_tests
                          end
        view('tests')
      end

      r.on 'new' do
        r.get do
          view('new_test')
        end

        r.post do
          @params = InputValidators.check_test(r.params['name'], r.params['date'], r.params['description'])
          if @params[:errors].empty?
            opts[:tests].add_test(Test.new(@params[:name], @params[:date], @params[:description]))
            r.redirect '/tests'
          else
            view('new_test')
          end
        end
      end
    end
  end
end
