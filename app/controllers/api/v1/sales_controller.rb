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
    # check if the stock is ok
    product = Product.find(sale_params[:product_id])
    if product.stock > 0
      @sale = Sale.new(sale_params)
      if @sale.save
        current_stock = product.stock # Reduce stock from the product
        product.update_attribute(:stock, current_stock - 1)
        render json: { message: "ENJOY!", sale: @sale, product: product }, status: 201
      else
        render json: { message: 'Something is wrong' }, status: 404
      end
    else
      render json: { message: 'SO SORRY! We have no stock.' }, status: 404
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:sold_date, :product_id)
  end

  def set_sale
    @sale = Sale.where(id: params[:id])
  end
end
