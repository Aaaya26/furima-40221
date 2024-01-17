class ItemsController < ApplicationController
  private

  def message_params
    params.require(:item).permit(:item_name, :item_data, :item_category_id, :item_status_id, :charge_id, :prefecture_id, :ship_date_id, :price :image).merge(user_id: current_user.id)
  end
end
