class RecipeApp < Sinatra::Base
  # index
  get "/ingredients" do
    @ingredients = Ingredient.all
    erb(:"ingredients/index")
  end

  # new
  get "/ingredients/new" do
    @ingredient = Ingredient.new
    erb(:"ingredients/new")
  end

  # create
  post "/ingredients" do
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      redirect("/ingredients/#{@ingredient.id}")
    else
      erb(:"ingredients/new")
    end
  end

  # show
  get "/ingredients/:id" do
    @ingredient = Ingredient.find(params[:id])
    erb(:"ingredients/show")
  end

  # edit
  get "/ingredients/:id/edit" do
    @ingredient = Ingredient.find(params[:id])
    erb(:"ingredients/edit")
  end

  # update
  post "/ingredients/:id/update" do
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(params[:ingredient])
      redirect("/ingredients")
    else
      erb(:"ingredients/new")
    end
  end

  # delete
  post "/ingredients/:id/delete" do
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.destroy
      redirect("/ingredients")
    else
      redirect("/ingredients/#{@ingredient.id}")
    end
  end
end