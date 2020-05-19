def main
  puts "Приложение-повторятель"
  s="start"
  while(s!="stop, please") do
      print  "Введите строку> "
      s=gets.strip
      converted_s = s.encode('UTF-8')
      puts converted_s
  end

end


if __FILE__ == $0
    main
end