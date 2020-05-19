require_relative 'my_complex'

def main
    
    my_complex_one = MyComplex.new(6,0)
    my_complex_two = MyComplex.new(2,0)
    pp my_complex_one
    pp my_complex_two
    puts  "Первое число: "+ my_complex_one.to_s
    puts "Второе число: "+ my_complex_two.to_s
    
    print "Сумма: "
    puts my_complex_one.add(my_complex_two)
    print "Разность:"
    puts my_complex_one.sub(my_complex_two)
    print "Умножение: "
    puts my_complex_one.multiply(my_complex_two)
    print "Деление: "
    puts my_complex_one.divide(my_complex_two)

end


if __FILE__ == $0
    main
end