#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

if ARGV.size == 0
  # spec1
  # 引数が空のときの挙動を保存しておく
  puts "オムライス"
else
  # spec3-
  filename = ARGV.shift
  recipes = File.read(filename)

  # idとレシピを紐付けたmapを作る
  id = 0
  recipes_map = {}
  recipes.each_line {|line|
  	recipes_map[id] = line
  	id += 1
  }

  if ARGV.empty?
  	# spec3-5
    recipes_map.each_pair {|k, v|
      puts "#{k}: #{v}"
    }
  else
    # spec6-
    key = ARGV.shift.to_i
    puts recipes_map[key]
  end
end
