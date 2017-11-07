require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest
 def setup
   @chef=Chef.create!(chefname:"wendy", email:"aasdfgki@gadf.com")
    @recipe = Recipe.create(name:"vegetable saute",
    description:"great vegatable saute",chef: @chef)
 end
 
 test "reject invalid update" do
   get edit_recipe_path(@recipe)
   assert_template 'recipes/edit'
   patch recipe_path(@recipe), params: { recipe: {name:" ",description:"some description "}}
   assert_template 'recipes/edit'
   assert_select 'h2.panel-title'
   assert_select 'div.panel-body'
 end
 
 test "successfully edit a recipe" do
   get edit_recipe_path(@recipe)
   assert_template 'recipes/edit'
   updated_name= "updated recipe name"
   updated_description="updateed recipe description"
   patch recipe_path(@recipe), params: { recipe: {name: updated_name, description: updated_description}}
   assert_redirected_to @recipe
   assert_not flash.empty?
   @recipe.reload
   assert_match name_of_recipe.capitalize,response.body
   assert_match description_of_recipe, response.body
 end
 
 
 
end
