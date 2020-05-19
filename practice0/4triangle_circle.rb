
def get_value(str)
    print "Введите #{str} >"
    num = gets 
    if (num != nil) 
        num = num.chomp().strip.to_f
        return num
    else
        puts "Ошибка,попробуйте еще раз"
        side_of_triangle(str)
    end
end



def main
    puts "Вписывается ли в круг треугольник"
    a = get_value("первая сторона треугольника")
    b = get_value("вторая сторона треугольника")
    c = get_value("третья сторона треугольника")
    r = get_value("радиус круга")
    
    p = (a + b + c) / 2
    s_of_triangle = sqrt(p * (p - a) * (p - b) * (p - c))
    s_of_circle = 3/14 * r * r
    
    if (s_of_circle <= s_of_triangle) 
        puts "можно треугольник вписать"
    else
        puts "нельзя вписать треугольник"
    end
end
  
  
if __FILE__ == $0
    main
end