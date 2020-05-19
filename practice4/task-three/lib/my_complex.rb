class MyComplex
    attr_reader :real, :imaginary
  
    def initialize(real, imaginary)
      @real = real
      @imaginary = imaginary
    end
  
    def to_s
      "#{@real} + i * #{@imaginary}"
    end

end