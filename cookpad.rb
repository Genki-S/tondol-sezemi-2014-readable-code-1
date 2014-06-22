#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

if ARGV.size == 0
  # spec1
  # 引数が空のときの挙動を保存しておく
  puts "オムライス"
else
  # spec3-
  filename = ARGV.shift
  recipe = File.read(filename)
  recipe.each_line {|line|
    puts line
  }
end
