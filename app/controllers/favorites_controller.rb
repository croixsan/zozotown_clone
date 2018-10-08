class FavoritesController < ApplicationController
  before_action :set_render_parameter, only: [:create, :destroy]

  def index
    @favorite_items = current_user.favorite_items
    @favorite_brands = current_user.favorite_brands
  end

  def create
    current_user.favorite_items.create(item_num_id: params[:item_num_id])
  end

  def brand_create
    current_user.favorite_brands.create(brand_id: params[:brand_id])
    @brand = Brand.find(params[:brand_id])
  end

  def destroy
    favorite_items = current_user.favorite_items
    favorite_items.find_by(item_num_id: params[:item_num_id]).destroy()
    respond_to do |format|
      format.html{
        redirect_to favorites_path
      }
      format.js{}
    end
  end

  def brand_destroy
    FavoriteBrand.find(params[:id]).destroy()
    @brand = Brand.find(params[:id])
  end

  private
  def set_render_parameter
    # 部分テンプレートのrenderパラメーターを設定
    @item = Item.find(params[:item_id])
    @shop = @item.shop
    @item_num_id = params[:item_num_id]
  end
end
