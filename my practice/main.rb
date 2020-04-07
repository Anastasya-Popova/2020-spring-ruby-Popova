
def main
 #  print "Введите числа для суммы. Для завершения введите Over"
 # sum=0
 #s = gets.strip
 # str="Over"
 # while (s !=str) 
 #  sum+=s.to_f;
 # s = gets.strip
 #end
 #print sum
 a="--help"
 if ARGV.length==0
  print "Введите делимое и делитель delimoe delitel"
 elseif ARGV[0]==a
  print--delimoe=Delimoe  Делимое
  print--delitel=Delitel  Делитель
 else
  delimoe=ARGV[0].to_i
  delitel=ARGV[1].to_i
  res=delimoe/delitel
  puts "Частное" res
 end 


end

if __FILE__ == $0
    main
end