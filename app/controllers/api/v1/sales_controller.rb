module Api
  module V1
    class SalesController < ApplicationController
      before_action :set_sale, only: [:show, :update, :destroy]
      def index
        sales = Sale.all
        render json: sales
      end

      def show
        render json: @sale
      end

      def create
        @sale = Sale.new(sale_params)
        if @Sale.save
          render json: { message: 'Successfully created', sale: @sale }, status: 200
        else
          render json: { message: 'Something is wrong' }, status: 404
        end
      end

      def update
        if @Sale.update(sale_params)
          render json: { message: 'Successfully updated', sale: @sale }, status: 200
        else
          render json: { message: 'Something is wrong' }, status: 404
        end
      end

      def destroy
        if @sale
          @Sale.destroy
          render json: { message: `#{@Sale.name} was successully deleted`, deleted_sale: @sale }, status: 200
        else
          render json: { error: 'sale could not be deleted' }, status: 404
        end
      end

      private

      def sale_params
        params.require(:sale).permit(:sold_date, :product_id)
      end

      def set_sale
        @sale = Sale.find(params[:id])
      end
    end
  end
end
