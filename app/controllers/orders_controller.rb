class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def all
    @orders = Order.all
  end

  def index
    @orders = Order.all
    @item = FoodItem.find(params[:food_item_id])
  end

  def new
    @item = FoodItem.find(params[:food_item_id])
    @order = @item.orders.build
  end

  def create
    @item = FoodItem.find(params[:food_item_id])
    @order = @item.orders.build order_params

    if @order.save
      redirect_to "/food_items/#{@order.food_item_id}/orders/#{@order.id}", flash: {success: "Thank you for your order!"}
    else
      render 'new'
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to food_item_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end
    def order_params
      params.require(:order).permit(:name, :phone, :address, :quantity)
    end
end
