def data(info)
    for arg in ARGV
        data = arg
        if data =~ /--name=/
            tmp = data[7, data.length]
            if tmp.length > 0
                info[:name] = tmp
            else
                puts "Пустая строка в  --name"
                break
            end
        end
        if data =~ /--surname=/
            tmp = data[10, data.length]
            if tmp.length > 0
                info[:surname] = tmp
            else 
                puts "Пустая строка в --surname"
                break
            end
        end
        if data =~ /--age=/
            tmp = data[6, data.length]
            if tmp.length > 0
                res = tmp.to_i
                if res > 15 && res < 100
                    info[:age] = tmp.to_i
                else
                    puts "Ваш воздраст не подходит для работы: age > 15 & age < 100"
                    break
                end
            else 
                puts "Пустая строка в  --age"
                break
            end
        end
        if data =~ /--experience=/
            tmp = data[13, data.length]
            if tmp.length > 0
                res = tmp.to_i
                info[:experience] = res
            else 
                puts "Пустая строка в --experience"
                break
            end
        end
        if data =~ /--mail=/
            tmp = data[7, data.length]
            if (tmp.length > 0)
                info[:mail] = tmp
            else 
                puts "Пустая строка в --mail"
                break
            end
        end
    end
    info
end

def check_argv
    if ARGV.length > 1 && ARGV.length < 5
        puts "Слишком мало данных"
        exit(1)
    elsif ARGV.length == 1
        puts "Введите свои данные так --name=NAME --surname=SURNAME --mail=MAIL --age=AGE --experience=EXPERIENCE"
    elsif ARGV.length > 5
        puts "слишком много аргументов"
        exit(1)
    end
end

def entrepreneur(info)
    if info[:name] == "Petr" && info[:surname] == "Petrovich"
        return "Руководитель "
    end
    return ""
end

def engineer(info)
    if info[:mail].include? "code"
        return "Инженер "
    end
    return ""
end

def intern(info)
    if info[:experience] < 2
        return "Стажер "
    end
    return ""
end

def old(info)
    if info[:age] > 45 && info[:age] < 60
        return "Бывалый "
    end
    return ""
end

def profi(info)
    if info[:experience] > 15
        return "заслуженный "
    end
    return ""
end

def famous(info)
    if info[:experience] > 5
        return "Известный "
    end
    return ""
end

def main 
    puts "Поиск работы"
    check_argv    
    info = Hash.new(nil)
    info = data(info)
    profession = ""
    profession.concat(entrepreneur(info))
    profession.concat(engineer(info))
    profession.concat(intern(info))
    profession.concat(old(info))
    profession.concat(profi(info))
    profession.concat(famous(info))
    puts profession
end

  
  
  if __FILE__ == $0
      main
  end