def get_string
    print "Enter a number > "
    gets.chomp().lstrip.rstrip
end


def main
    sum = 0.0
    puts "это калькулятор"
    
    string = get_string
    
    while string != "over" do
        number = string.to_f
        sum += number
        puts "Sum is #{sum}"
        puts "Number is #{number}"
        string = get_string
    end
    
    puts "Final sum is #{sum}"
end
  
  
  if __FILE__ == $0
      main
  end