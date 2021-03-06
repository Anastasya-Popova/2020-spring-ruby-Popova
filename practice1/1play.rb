def get_num(str, idx)
    puts "Your #{str} is > #{ARGV[idx]} "
    num = ARGV[idx].chomp().strip.to_i
    return num
end

def get_res(money)
    value = rand(15)
    case value
    when 15
        money *= 0.1
    when 13..14
        money *= 0.02
    when 10..12
    when 8..9
        money -= money * 0.02
    when 6..7
        money -= money * 0.1
    else
        money -= money * 0.5
    end
    #puts "#{value}  #{money}"
    return money
end

def check_argv
    if ARGV.length < 2 && ARGV.length > 0
        puts "слишком мало аргументов"
        exit(1)
    elsif ARGV.length == 0
        puts "You're about to play the market! Good luck!"
        puts "stocks_game.rb INVESTMENT DAYS_ON_MARKET"
    elsif ARGV.length > 2
        puts "Cлишком много аргументов"
        exit(1)
    end
end

def main 
    check_argv    
    money = get_num("деньги", 0)
    days = get_num("дни", 1)

    days.times do 
        money = get_res(money)
    end
    puts "у вас осталось #{money} " 
end

if __FILE__ == $0
    main
end