class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_price = 800
    @order.total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal } + @order.shipping_price
    if params[:order][:address_number] == "1"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.full_name
    elsif params[:order][:address_number] == "2"
      @order.shipping_postal_code = Address.find(params[:order][:registered]).postal_code
      @order.shipping_address = Address.find(params[:order][:registered]).address
      @order.shipping_name = Address.find(params[:order][:registered]).name
    elsif params[:order][:address_number] == "3"
      @order.shipping_postal_code = params[:order][:shipping_postal_code]
      @order.shipping_address = params[:order][:shipping_address]
      @order.shipping_name = params[:order][:shipping_name]
    else
      render :new
     end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id
        @order_detail.order_id = @order.id
        @order_detail.amount = cart_item.amount
        @order_detail.purchase_price = cart_item.subtotal
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to "/orders/complete"
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_postal_code, :shipping_address, :shipping_name, :shipping_price, :total_price, :payment_method, :status)
  end

end