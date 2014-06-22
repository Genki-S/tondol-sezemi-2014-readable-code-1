#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

class User
  def initialize(name)
    @name = name
  end

  attr_reader :name
end

class Recipe
  @@recipe_count = 0

  def initialize(name)
    @name = name
    @id = @@recipe_count
    @@recipe_count += 1
  end

  def self.load(str)
    Recipe.new(str)
  end

  attr_reader :name, :id
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
  user_recipe_data_pairs = []
  # ARGV: user, file, user, file, ..., recipe_id
  while ARGV.size >= 2
    user_name, file_name = ARGV.shift(2)
    user = User.new(user_name)
    str = File.read(file_name)
    recipe_data = RecipeData.load(str)
    user_recipe_data_pairs += [user, recipe_data]
  end

  specified_id = unless ARGV.first.nil?
                   ARGV.first.to_i
                 else
                   nil
                 end

  is_first_user = true
  user_recipe_data_pairs.each_slice(2) do |user, recipe_data|
    puts "" unless is_first_user # spacer
    is_first_user = false

    puts "ユーザー名: #{user.name}"
    recipe_data.recipes.each {|recipe|
      # show all recipes when no id is specified
      next if specified_id && recipe.id != specified_id
      puts "#{recipe.id}: #{recipe.name}"
    }
  end
end
