class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @editcustomer = current_customer
  end

  def update
    @editcustomer = current_customer
    @editcustomer.is_deleted = false
    if @editcustomer.update(customer_params)
      redirect_to '/customers/my_page'
    else
      redirect_to '/customers/my_page'
    end
  end

  def unsubscribe
  end

  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

end