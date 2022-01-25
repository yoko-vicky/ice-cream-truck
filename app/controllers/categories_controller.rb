module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: [:show, :update, :destroy]
      def index
        categories = Category.all
        render json: categories
      end

      def show
        render json: @category
      end

      def create
        @category = Category.new(category_params)
        if @category.save
          render json: { message: 'Successfully created', category: @category }, status: 200
        else
          render json: { message: 'Something is wrong' }, status: 404
        end
      end

      def update
        if @category.update(category_params)
          render json: { message: 'Successfully updated', category: @category }, status: 200
        else
          render json: { message: 'Something is wrong' }, status: 404
        end
      end

      def destroy
        if @category
          @category.destroy
          render json: { message: `#{@category.name} was successully deleted`, deleted_category: @category }, status: 200
        else
          render json: { error: 'Category could not be deleted' }, status: 404
        end
      end

      private

      def category_params
        params.require(:category).permit(:name, :price, :category_id, :sold_date)
      end

      def set_category
        @category = Category.find(params[:id])
      end
    end
  end
end
