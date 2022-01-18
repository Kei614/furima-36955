class PurchaseRecordsController < ApplicationController
  before_action :set_item, only:[:index,:create]
  before_action :authenticate_user!, only: :index
  before_action :move_to_root, only: :index
  

  def index
    binding.pry
    @purchase_record_destination = PurchaseRecordDestination.new
  end

  def create
    @purchase_record_destination = PurchaseRecordDestination.new(purchase_record_params)
    if @purchase_record_destination.valid?
      @purchase_record_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_destination).permit(:zip_code,:prefecture_id,:city,:address,:building,:telephone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path if current_user.id == @item.user.id
  end
end
