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

  # idとレシピを紐付けたmapを作る
  id = 0
  recipe_map = {}
  recipe.each_line {|line|
  	recipe_map[id] = line
  	id += 1
  }

  recipe_map.each_pair {|k, v|
  	puts "#{k}: #{v}"
  }
end
