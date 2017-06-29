vowels = 'aeiou'

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |value|
  value.each do |word|
    word.chars.each do |char|
      puts char if vowels.include?(char)
      end
  end
end