class Api::V1::SalesController < ApplicationController
  before_action :set_sale, only: %i[show]

  def index
    sales = Sale.all
    render json: sales
  end

  def show
    render json: @sale
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      @product = Product.find(@sale.product_id)
      render json: { message: "#{@product.name} was purchased", sale: @sale, product: @product }, status: 201
    else
      render json: { message: 'Something is wrong' }, status: 404
    end
  end

      private

  def sale_params
    params.require(:sale).permit(:sold_date, :product_id)
  end

  def set_sale
    @sale = Sale.where(product_id: params[:product_id])
  end
end
