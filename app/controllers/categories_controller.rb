class CategoriesController < ApplicationController
before_action :require_user, except: [:show]
before_action :require_admin, except: [:show]
 # def index
 #   @category = Category.all
 # end

  def show
    @category = Category.find_by(slug: params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice]= "Your category was saved"
      redirect_to posts_path
    else
      render 'new'
    end
      
  end

 # def edit
 # end

 # def update
 # end


  private

  def category_params
    params.require(:category).permit(:name)
  end

end