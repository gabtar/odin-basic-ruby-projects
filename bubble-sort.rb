#!/usr/bin/env ruby

# Bubble sort - For the Odin project
# ------------------------------------------------
# Build a method #bubble_sort that takes an array and returns a sorted
# array. It must use the bubble sort methodology (using #sort would be 
# pretty pointless, wouldn’t it?).
#
# Usage:
# ruby bubble-sort.rb <numbers>
# <numbers> An array of space separated numbers
#
# Sample usage
# >./bubble-sort.py 5 5 1 9 10 25 2 1
# [1, 1, 2, 5, 5, 9, 10, 25]


def bubble_sort(array)

  is_sorted = false
  last_index = array.length - 1

  while not is_sorted 
    swaps = false
    
    last_index.times do |index|
      if array[index] > array[index + 1]
        swaps = true
        temp = array[index]
        array[index] = array[index + 1]
        array[index + 1] = temp
      end
    end

    last_index -= 1
    is_sorted = true if not swaps
  end

  array
end

# Tests
# p bubble_sort([1,2,3,45,5,6,6])
# p bubble_sort([4,3,78,2,0,2])
# p bubble_sort([234,32,78,12,4,2,1,203,23])

# Calling from command line
if ARGV.length < 1
  puts "Usage: ruby bubble-sort.rb 4 5 6 6"
else
  p bubble_sort(ARGV.map(&:to_i))
end
