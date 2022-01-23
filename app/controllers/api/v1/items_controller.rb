module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_item, only: [:show, :update, :destroy]
      def index
        items = Item.all
        render json: items, status: 200
      end

      def show
        render json: @item, status: 200
      end

      def create
        @item = Item.new(item_params)
        if @item.save
          render json: {message: 'Successfully created', item: @item}, status: 200
        else
          render json: {message: 'Something is wrong', item: @item}, status: 404
        end
      end

      def update
        if @item.update(item_params)
          render json: {message: 'Successfully updated', item: @item}, status: 200
        else
          render json: {message: 'Something is wrong', item: @item}, status: 404
        end
      end

      def destroy
        if @item
          @item.destroy
          render json: { message: `#{@item.name} was successully deleted`, deleted_item: @item }, status: 200
        else
          render json: { error: 'Item could not be deleted' }, status: 404
        end
      end

      private

      def category_params
        params.require(:category).permit(:name, :max, :stock)
      end
      def set_category
        @category = Category.find(params[:id])
      end
    end
  end
end
