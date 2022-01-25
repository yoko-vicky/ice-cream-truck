module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update, :destroy]
      def index
        products = Product.all
        render json: products
      end

      def show
        render json: @product
      end

      def create
        @product = Product.new(product_params)
        if @Product.save
          render json: { message: 'Successfully created', product: @product }, status: 200
        else
          render json: { message: 'Something is wrong' }, status: 404
        end
      end

      def update
        if @Product.update(product_params)
          render json: { message: 'Successfully updated', product: @product }, status: 200
        else
          render json: { message: 'Something is wrong' }, status: 404
        end
      end

      def destroy
        if @product
          @Product.destroy
          render json: { message: `#{@Product.name} was successully deleted`, deleted_product: @product }, status: 200
        else
          render json: { error: 'product could not be deleted' }, status: 404
        end
      end

      private

      def product_params
        params.require(:product).permit(:name, :price, :stock, :category_id)
      end

      def set_product
        @product = Product.find(params[:id])
      end
    end
  end
end
