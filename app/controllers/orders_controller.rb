class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def sales
    @orders =Order.all.where(seller: current_user).order("created_at DESC")
  end
  
  def purchases
  @orders =Order.all.where(buyer: current_user).order("created_at DESC")
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @listing = Listing.find(params[:listing_id])
    @order.listing_id = @listing.id
    @seller = @listing.user
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id

    respond_to do |format|
      if  @order.save
        format.html { redirect_to root_url, notice: 'Order was sucessfully created'}
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @order.update(order_params)
  end

  def destroy
    @order.destroy
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:address, :city, :state)
    end
end