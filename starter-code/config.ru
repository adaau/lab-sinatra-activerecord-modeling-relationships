require 'rubygems'
require 'bundler'
Bundler.require

require "./models/course"
require "./models/ingredient"
require "./models/recipe"

require "./app"
require "./controllers/courses_controller.rb"
require "./controllers/ingredients_controller.rb"
require "./controllers/recipes_controller.rb"

run RecipeApp