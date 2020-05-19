# frozen_string_literal: true
require_relative '../lib/rating_creator.rb'

# Kind of Main
def main
   el = RatingCreator.new
   el.create
end
  
  
if __FILE__ == $0
    main
end