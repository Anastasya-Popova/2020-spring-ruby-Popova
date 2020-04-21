# frozen_string_literal: true

require_relative '../lib/menu.rb'

# The main class
def main
  menu = Menu.new
  menu.show_menu
end

main if __FILE__ == $PROGRAM_NAME
