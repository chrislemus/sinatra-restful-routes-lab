class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get('/recipes') {
    @recipes = Recipe.all
    erb :index
  }

  post('/recipes') {
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{Recipe.last.id}"
  }

  get('/recipes/new') {
    erb :new
  }

  get('/recipes/:id/edit') {
    @recipe = Recipe.find(params[:id])
    erb :edit
  }

  patch('/recipes/:id/edit') {
    recipe = Recipe.find(params[:id])
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save
    redirect "/recipes/#{recipe.id}"
  }

  get('/recipes/:id') {
    @recipe = Recipe.find(params[:id])
    erb :show
  }

  delete('/recipes/:id') {
    recipe = Recipe.find(params[:id])
    recipe.destroy
  }

end
