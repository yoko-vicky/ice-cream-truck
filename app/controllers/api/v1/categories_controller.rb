class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  def index
    categories = Category.all
    render json: categories, status: 200
  end

  def show
    render json: @category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: { message: "#{@category.name} was successfully created", category: @category }, status: 201
    else
      render json: { message: 'Something is wrong' }, status: 404
    end
  end

  def update
    if @category.update(category_params)
      render json: { message: "#{@category.name} was successfully updated", category: @category }, status: 200
    else
      render json: { message: 'Something is wrong' }, status: 422
    end
  end

  def destroy
    if @category
      @category.destroy
      render json: { message: "#{@category.name} was successully deleted", deleted_category: @category }, status: 200
    else
      render json: { error: 'Category could not be deleted' }, status: 404
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :max)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
