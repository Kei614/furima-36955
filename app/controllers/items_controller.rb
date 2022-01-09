class ItemsController < ApplicationController
  before_action :authenticate_user! ,only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_parameter)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_parameter
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :delivery_charge_id, :prefecture_id,
                                 :days_to_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
