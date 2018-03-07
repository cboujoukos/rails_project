class CategoriesController < ApplicationController
  before_action :require_admin_status, only: [:new, :create, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      flash.now[:alert] = "Category must have a title"
      render "new"
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.update(category_params)
    if @category.save
      redirect_to @category
    else
      render "edit"
    end
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end
end
