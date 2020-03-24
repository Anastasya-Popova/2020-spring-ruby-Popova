class MyComplex
  attr_reader :real, :imaginary

  def initialize(real, imaginary)
      @real = real
      @imaginary = imaginary
  end

  def to_s
    "#{@real} + i * #{@imaginary}"
  end

  def add(second_number) 
      MyComplex.new(@real + second_number.real, @imaginary + second_number.imaginary)
  end

  def sub(second_number) 
      MyComplex.new(@real - second_number.real, @imaginary - second_number.imaginary)
  end

  def multiply(second_number) 
      r = @real * second_number.real - @imaginary * second_number.imaginary
      i = @imaginary * second_number.real + @real * second_number.imaginary
      MyComplex.new(r, i)
  end

  def divide(second_number) 
      square = second_number.real * second_number.real + second_number.imaginary * second_number.imaginary
      r = @real * second_number.real + @imaginary * second_number.imaginary
      i = @real * second_number.imaginary - @imaginary * second_number.real
      MyComplex.new(r / square, i / square)
  end
end