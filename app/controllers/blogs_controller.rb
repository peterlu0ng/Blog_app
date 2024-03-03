class BlogsController < ApplicationController

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @blog = Blog.find(params[:id])
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end


  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)
    if @blog.save #validation occurs if this fails
      flash[:notice] = "Blog was created successfully."
        redirect_to @blog
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    # binding.break
    @blog = Blog.find(params[:id])
    if @blog.update(params.require(:blog).permit(:title, :body))
      flash[:notice] = "Blog updated succesfully"
      redirect_to @blog
    else
      render "edit"
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy!
    redirect_to blogs_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
