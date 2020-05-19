=begin

Уплотнить массив чисел, 
удалив нули и сдвинув влево остальные элементы

=end

def main
    puts "Your array is #{input_data}"
    puts "Your res is (cycles): #{solve_with_cycles(input_data)}"
    puts "Your res is (iterators): #{solve_with_iterators(input_data)}"
end

def input_data
    [0,15,6,0,456,6,2,1,0]
end

#Elegant and clean solution without loops
def delete_zeros(array)
    array.delete(0)
    array
end

def solve_with_cycles(array)
    idx = 0
    for num in array
        if num == 0
            array.delete_at(idx)
        end
        idx += 1
    end
    array
end

def solve_with_iterators(array)
    array.delete_if { |num| num == 0}
    array
end

if __FILE__ == $0
    main
end