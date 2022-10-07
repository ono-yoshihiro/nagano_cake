class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @editcustomer = Customer.find(params[:id])
  end

  def update
    @editcustomer = Customer.find(params[:id])
    if @editcustomer.update(customer_params)
      redirect_to admin_customer_path
    else
      #本当はrenderでエラーメッセージを表示させたいがエラーになる
      redirect_to admin_customer_path
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

end