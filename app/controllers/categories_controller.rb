class CategoriesController < ApplicationController
  def edit
    @categories = Category.all
    @payments = Payment.all
  end
  def new
    @new = Category.new(name: params[:name])
    @new.save
    redirect_to("/category_edit")
  end
  
  def delete
    @delete = Category.find_by(id: params[:id])

    if @delete
      @delete_payment = Payment.where(category_id: @delete.id)
  
      @delete_payment.each do |payment|
      List.where(payment_id: payment.id).destroy_all
    end
  
      @delete_payment.destroy_all
  
      @delete.destroy
    end
    redirect_to("/category_edit")
  end
end
