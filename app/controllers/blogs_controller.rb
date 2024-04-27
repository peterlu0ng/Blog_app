class BlogsController < ApplicationController
  before_action :set_blog, only: [ :show, :edit, :update, :destroy ]
  before_action :require_user, except: [ :show, :index ]
  before_action :require_same_user, only: [ :edit, :update, :destroy ]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all.sort
    @blogs = Blog.paginate(page: params[:page], per_page: 5)

  end

  # GET /blogs/1 or /blogs/1.json
  def show

  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  def edit

  end


  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user
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

    if @blog.update(blog_params)
      flash[:notice] = "Blog updated succesfully"
      redirect_to @blog
    else
      render "edit"
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy

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
      params.require(:blog).permit(:title, :body, category_ids: [])
    end
    def require_same_user
      if current_user != @blog.user
        flash[:alert] = "You can only edit or delete your own blog"
        redirect_to @blog
      end
    end
end
