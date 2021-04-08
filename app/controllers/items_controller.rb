class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :destroy]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
  end

  def destroy
      if current_user.id == @item.user_id 
      @item.destroy
      redirect_to root_path
    end
  end


  private
  def set_item
    @item = Item.find(params[:id])
  end
  

  def item_params
    params.require(:item).permit(:items_name, :description, :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, :price, :image
    ).merge(user_id: current_user.id)
  end


  

end
