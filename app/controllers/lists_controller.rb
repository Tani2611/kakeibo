class ListsController < ApplicationController
  def index
    @categories = Category.all
    @payments = Payment.all
    @lists = List.all
    @all_sum = List.sum(:price)
  
    @data = {}
    Category.joins(:lists).group("categories.id").each do |category|
      total_price = category.lists.sum(:price)
      @data[category.name] = total_price
    end
  end

  def new
    @list = List.create(
      name: params[:name],
      price: params[:price],
      category_id: params[:category_id],
      payment_id: params[:payment_id]
    )
    redirect_to "/"
  end

  def delete
    @delete = List.find_by(id: params[:id])
    @delete.destroy
    redirect_to("/")
  end
  
  def list
    @category_id = Category.find_by(id: params[:id])
    @category_in_payment = Payment.where(category_id: @category_id)

  end

end
