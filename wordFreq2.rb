# from devdaily.com
#
# a sample ruby program that determines the number of times each word in
# a file appears in that file (i.e., the frequency of that word).
#

system 'CHCP 1251'

the_file='test.txt'
h = Hash.new
f = File.open(the_file, "r")
f.each_line { |line|
  words = line.split(/[^а-€ј-я]/)
  words.each { |w|
    if h.has_key?(w)
      h[w] = h[w] + 1
    else
      h[w] = 1
    end
  }
}

# sort the hash by value, and then print it in this sorted order
h.sort{|a,b| a[1]<=>b[1]}.each { |elem|
  puts "\"#{elem[0]}\" - #{elem[1]} раз(а)"
}