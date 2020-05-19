=begin

Напечатать те элементы массива, индексы которых являются
степенями двойки

=end

def po2?(n)
    n.to_s(2).count('1') == 1
end

def print_array(array)
    array.each do |number|
        print number, " "
    end
    puts ""
end

def solve_with_cycles(array)
    res = []
    cur_idx = 0

    for number in array
        if po2?(cur_idx)
            res.push(number)
        end
        cur_idx += 1
    end
    print_array(res)
end

def solve_with_iterators(array)
    res = []

    array.each_with_index do |number, index|
        if po2?(index)
            res.push(number)
        end
    end
    print_array(res)
end

if __FILE__ == $0
    main
end