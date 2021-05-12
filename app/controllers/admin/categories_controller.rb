class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new
    if @category.save(category_params)
      redirect_to admin_categories_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:category_name)
  end

end
