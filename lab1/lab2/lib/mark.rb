# frozen_string_literal: true

# Describes the marks
class Mark
  attr_reader :three
  attr_reader :four
  attr_reader :five
  def initialize(_three, _four, _five)
    @three = 21
    @four = 26
    @five = 31
  end
end
