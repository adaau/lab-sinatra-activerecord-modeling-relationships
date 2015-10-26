class RecipeApp < Sinatra::Base
  # index
  get "/courses" do
    @courses = Course.all
    erb(:"courses/index")
  end

  # new
  get "/courses/new" do
    @course = Course.new
    erb(:"courses/new")
  end

  # create
  post "/courses" do
    @course = Course.new(params[:course])
    if @course.save
      redirect("/courses/#{@course.id}")
    else
      erb(:"courses/new")
    end
  end

  # show
  get "/courses/:id" do
    @course = Course.find(params[:id])
    erb(:"courses/show")
  end

  # edit
  get "/courses/:id/edit" do
    @course = Course.find(params[:id])
    erb(:"courses/edit")
  end

  # update
  post "/courses/:id/update" do
    @course = Course.find(params[:id])
    if @course.update(params[:course])
      redirect("/courses")
    else
      erb(:"courses/new")
    end
  end

  # delete
  post "/courses/:id/delete" do
    @course = Course.find(params[:id])
    if @course.destroy
      redirect("/courses")
    else
      redirect("/courses/#{@course.id}")
    end
  end

end