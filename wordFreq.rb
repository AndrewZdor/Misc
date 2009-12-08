#replace 'filename.txt' with the file you want to process

system 'CHCP 1251'

#puts 'What is the name and path of the file?'
#filename = gets.chomp

filename = 'test.txt'

words = File.open(filename) {|f| f.read }.split(/[^à-ÿÀ-ß]/) 
freqs=Hash.new(0) 
words.each { |word| freqs[word] += 1 } 
freqs.sort_by {|x,y| y }.reverse.each {|w, f| puts w+'-'+f.to_s}

#puts 'What is the name and path of the file?'
#filename = gets.chomp
#filename = 'test.txt'
#text = String.new
#File.open(filename) { |f| text = f.read } 
#words = text.split(/[^a-zA-Z]/)
#freqs = Hash.new(0)
#words.each { |word| freqs[word] += 1 }
#freqs = freqs.sort_by {|x,y| y }
#freqs.reverse!
#freqs.each {|word, freq| puts word+' '+freq.to_s}
