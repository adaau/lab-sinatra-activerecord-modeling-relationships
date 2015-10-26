class RecipeApp < Sinatra::Base
  # index
  get "/recipes" do
    @recipes = Recipe.all
    erb(:"recipes/index")
  end

  # new
  get "/recipes/new" do
    @recipe = Recipe.new
    erb(:"recipes/new")
  end

  # create
  post "/recipes" do
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect("/recipes/#{@recipe.id}")
    else
      erb(:"recipes/new")
    end
  end

  # show
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb(:"recipes/show")
  end

  # edit
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb(:"recipes/edit")
  end

  # update
  post "/recipes/:id/update" do
    @recipe = Recipe.find(params[:id])
    if @recipe.update(params[:recipe])
      redirect("/recipes")
    else
      erb(:"recipes/new")
    end
  end

  # delete
  post "/recipes/:id/delete" do
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect("/recipes")
    else
      redirect("/recipes/#{@recipe.id}")
    end
  end

end