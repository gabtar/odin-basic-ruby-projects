#!/usr/bin/env ruby

# Stock Picker - For the Odin project
# ------------------------------------------------
# Implement a method #stock_picker that takes in an array of stock prices, 
# one for each hypothetical day. It should return a pair of days representing
# the best day to buy and the best day to sell. Days start at 0.
#
# Usage:
# ruby stock-picker.rb <picks>
# <picks> An array of space separated numbers that represents the hypothetical
# stock prices
#
# Sample usage
# >./stock-picker.py 5 6 8 10 15 12 22 90
# {buy_index: 0, sell_index: 7, max_profit: 85}  


def stock_picker(stock_prices)

  # Auxiliar variable
  best_pick = {
    buy_index: nil,
    sell_index: nil,
    max_profit: 0
  }

  stock_prices.each_with_index do |start_price, start_index|
    stock_prices[start_index + 1..-1].each_with_index do |end_price, end_index|
      current_profit = end_price - start_price
      if current_profit > best_pick[:max_profit]
        best_pick[:max_profit] = current_profit
        best_pick[:buy_index] = start_index
        best_pick[:sell_index] = start_index + 1 + end_index # Need to track index in the original array
      end 
    end 
  end 
  best_pick
end

# Tests
# p stock_picker([17,3,6,9,15,8,6,1,10]) # Max = [1,4] $12
# p stock_picker([4,6,34,9,1,3,33,22,10]) # Max = [4,6] $32
# p stock_picker([4,4,4,4]) # No max profit
# p stock_picker([4,3,2,1]) # No max profit

# Calling from command line
if ARGV.length < 1
  puts "Usage: ruby stock-prices.rb 4 5 6 6"
else
  puts stock_picker(ARGV.map(&:to_i))
end
