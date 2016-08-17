class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @categories = current_user.categories
    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    @category.save
    respond_with(@category)
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :user_id)
    end
end
