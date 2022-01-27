class Api::V1::OverviewController < ApplicationController
  def index
    # amount sales, items, sales of each item
    sales_hash = {}
    items_hash = {}
    amount_sales = 0
    num_sold_items = 0

    Product.sort_by_latest.each do |pr|
      sales_hash[pr.name] = pr.total_sales
      items_hash[pr.name] = pr.sales.count
      amount_sales += pr.total_sales
      num_sold_items += pr.sales.count
    end

    # Stock
    stocks = Product.pluck(:stock)
    total_stocks = stocks.sum

    render json: {
      total_amount_of_sales: amount_sales,
      total_number_of_sold_items: num_sold_items,
      total_number_of_stocks: total_stocks,
      sales_for_each_item: sales_hash,
      total_number_of_each_sold_item: items_hash
    }, status: 200
  end
end
