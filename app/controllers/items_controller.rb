class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
      if @item.valid?
        @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  def item_params
    params.require(:item).permit(:items_name, :description, :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, :price, :image
    ).merge(user_id: current_user.id)
  end


  

end
