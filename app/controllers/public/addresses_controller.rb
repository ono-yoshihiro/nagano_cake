class Public::AddressesController < ApplicationController

  def index
    @addresses = current_customer.addresses.all
    @newaddress = Address.new
  end

  def edit
    @editaddress = Address.find(params[:id])
  end

  def create
    @newaddress = Address.new(address_params)
    @newaddress.customer_id = current_customer.id
    @newaddress.save
    redirect_to '/addresses'
  end

  def update
    @editaddress = Address.find(params[:id])
    @editaddress.update(address_params)
    redirect_to '/addresses'
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to '/addresses'
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end