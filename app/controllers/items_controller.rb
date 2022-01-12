class ItemsController < ApplicationController
  before_action :set_item ,only: [:show,:edit,:update]
  before_action :authenticate_user! ,except: [:index, :show]
  before_action :move_to_index ,only: :edit


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
  end

  def edit
  end

  def update
    if @item.update(item_parameter)
      redirect_to item_path(@item.id)
    else
      render "edit"
    end
  end

  private

  def item_parameter
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :delivery_charge_id, :prefecture_id,
                                 :days_to_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
