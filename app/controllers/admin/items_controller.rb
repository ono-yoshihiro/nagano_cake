class Admin::ItemsController < ApplicationController
#管理者側
  def new
    @newitem = Item.new
  end

  def create
    @newitem = Item.new(item_params)
    if @newitem.save
      redirect_to admin_item_path(@newitem.id)
    else
      @items = Item.page(params[:page])
      render :index
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.page(params[:page])
  end

  def edit
    @edititem = Item.find(params[:id])
  end

  def update
    @edititem = Item.find(params[:id])
    if @edititem.update(item_params)
      redirect_to admin_item_path
    else
      #本当はrenderでエラーメッセージも表示させたいが…
      redirect_to admin_item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end


end