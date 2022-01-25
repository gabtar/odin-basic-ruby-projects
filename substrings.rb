#!/usr/bin/env ruby

# Substrings - For The Odin Project
# ------------------------------------------------
# Implement a method #substrings that takes a word(string) as the first argument 
# and then an array of valid substrings (your dictionary) as the second 
# argument. It should return a hash listing each substring (case insensitive) 
# that was found in the original string and how many times it was found.
#
# Usage:
# ruby substrings.rb <string> [dictionary]
# <string> The word/string to count number of occurences in dictionary. Mandatory
# [dictionary] Optional list of space separated words of the dictionary.  e.g word1 word2 word3 ... 
#
# Sample usage
# >./substrings.py "below" low below
# { "below" => 1, "low" => 1 }
# >_


def substrings(string, dictionary)
  downcase = string.downcase # I assume dictionary has all words in lower case so, I ensure the method is case sensitive
  substrings = Hash.new(0) 

  # Using regex. #scan returns all matches
  # #match? method returns either true or false if strings matchs a pattern
  dictionary.reduce(substrings) do |count, word|
    count[word] += downcase.scan(word).length if downcase.match?(word) 
    count
  end
end

# Optional Odin default_dictionary for tests
default_dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


# Call from command line
if ARGV.length < 1
  puts "Usage: ruby substrings.rb <string> [dictionary]"
else
  input_length = ARGV.length
  input_length > 1 ? dictionary = ARGV.slice(1,input_length) : dictionary = default_dictionary
  puts substrings(ARGV[0], dictionary)
end
