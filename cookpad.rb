#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

class User
  def initialize(name)
    @name = name
  end

  attr_reader :name
end

class Recipe
  def initialize(name)
    @name = name
  end

  def self.load(str)
    Recipe.new(str)
  end

  attr_reader :name
end

class RecipeData
  def initialize(recipes)
    @recipes = recipes
  end

  def self.load(str)
    recipes = str.each_line.map {|line|
      Recipe.load(line)
    }
    RecipeData.new(recipes)
  end

  def has_recipe_for_id?(id)
    id.is_a?(Integer) && id >= 0 && id < @recipes.size
  end

  attr_reader :recipes
end

if ARGV.size == 0
  # spec1
  # 引数が空のときの挙動を保存しておく
  puts "オムライス"
else
  # spec3-
  user_name, filename, recipe_id_str = ARGV

  user = User.new(user_name)
  puts "ユーザー名: #{user.name}"

  str = File.read(filename)
  recipe_data = RecipeData.load(str)

  recipe_id = unless recipe_id_str.nil?
                recipe_id_str.to_i
              else
                nil
              end
  if recipe_id.nil?
    # spec3-5
    recipe_data.recipes.each_with_index {|recipe, id|
      puts "#{id}: #{recipe.name}"
    }
  else
    # spec6-
    if recipe_data.has_recipe_for_id?(recipe_id)
      recipe = recipe_data.recipes[recipe_id]
      puts "#{recipe_id}: #{recipe.name}"
    else
      # 与えられたキーが整数に変換できなかったり，
      # 対応するレシピが存在しなければ例外を発生させる
      raise ArgumentError.new("there is no recipe for given key")
    end
  end
end
