#!/usr/bin/env ruby

# Cesar Cipher - For the Odin project
# ------------------------------------------------
# Simple script in ruby that implements a Cesar Cipher
# https://en.wikipedia.org/wiki/Caesar_cipher 
#
# Usage:
# ruby caesar_cipher.py <phrase> <key>
# <phrase> The string to be encoded 
# <key> The shift value (number bewtween -26 and 26)
#
# Notes: ASCII codes
# Capital letters A-Z from 65 to 90
# Lower case letters a-z from 97 to 122


def caesar_cipher(phrase, key)

  unless key.between?(-26,26)
    puts "Invalid Key, must be in range [-26, 26]"
    return
  end

  # Check for negative shifts
  key > 0 ? key = key : key = 26 + key

  encoded_phrase = phrase.split("").map do |char|
    if is_a_letter?(char)
      ciphered_char = char.ord + key
      # Restart alphabet if out of bounds
      ciphered_char -= 26 if ciphered_char > 122 or (ciphered_char > 90 and char.ord < 97)
      ciphered_char.chr
    else
      char
    end
  end
  encoded_phrase.join
end

def is_a_letter?(char)
  char.between?('A','Z') or char.between?('a', 'z')
end


# Call from command line
unless ARGV.length == 2
  puts "Wrong parameters. Usage: > ruby caesar_cipher.rb <phrase> <key>"
else
  puts caesar_cipher(ARGV[0], ARGV[1].to_i)
end

