class ItemsController < ApplicationController
  before_action :authenticate_user! ,except: [:index, :show]

  def index
    @items = Item.includes(:user).order(created_at: "DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_parameter
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :delivery_charge_id, :prefecture_id,
                                 :days_to_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
