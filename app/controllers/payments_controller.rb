class PaymentsController < ApplicationController
  def new
    @category_id = Category.find_by(id: params[:id])
    @new = Payment.new(name: params[:name], category_id: @category_id.id)
    @new.save
    redirect_to("/category_edit")
  end

  def delete
    @delete = Payment.find_by(id: params[:id])
    @delete_list = List.where(payment_id: @delete.id)
    @delete.destroy
    @delete_list.destroy_all
    redirect_to("/category_edit")
  end
end
