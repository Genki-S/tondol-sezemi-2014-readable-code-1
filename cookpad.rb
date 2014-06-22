#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

if ARGV.size == 0
  # spec1
  # 引数が空のときの挙動を保存しておく
  puts "オムライス"
else
  # spec3-
  # 入力が1行のレシピのみを含むと仮定する
  filename = ARGV.shift
  recipe = File.read(filename).chomp
  puts recipe
end
