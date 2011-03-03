#! /usr/bin/env ruby
root_word = ARGV[0] || ''
word_size = ARGV[1].to_i 
word_size = 3 if word_size == 0
domain_names = []
dictionary = File.read('/usr/share/dict/words').split("\n").select{|d| d.size == word_size}
dictionary.each do |word|
	domain_names.push("#{word}#{root_word}.com")
end
system("touch #{root_word}.txt")
names = File.open("#{root_word}.txt", 'w')
domain_names.each do |name|
	names.write("#{name}\n")
end
names.close
