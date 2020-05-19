=begin

 Определить, сколько раз в последовательности
 из целых чисел меняется знак,
 а также номера позиций, в которых 
 происходит сменазнака

=end

def main
    print_array(input_data)
    solve_with_cycles(input_data)
    solve_with_iterators(input_data)
end

def input_data
    [3, 3, 377, -1,6,-1,-4,2]
end

def get_sign(value)
    if value < 0
        return :negative
    end
    :positive
end

def print_array(array)
    array.each do |number|
        print number, " "
    end
    puts ""
end

def print_res(array, amount)
    print "Массив: "
    print_array(array)
    print "количество смен знака: ", amount
    puts ""
end

def solve_with_cycles(array)
    res = []
    cur_idx = 0
    cur_sign = get_sign(array[0])
    for number in array
        cur_idx += 1
        if (get_sign(number) != cur_sign)
            cur_sign = get_sign(number)
            res.push(cur_idx)
        end
    end
    print_res(res, res.length)
end

def solve_with_iterators(array)
    cur_sign = get_sign(array[0])
    amount_of_changes = 0
    res = []

    array.each_with_index do |number, index|
        if (get_sign(number) != cur_sign)
            cur_sign = get_sign(number)
            res.push(index + 1)
        end
    end
    print_res(res, res.length)
end

if __FILE__ == $0
    main
end