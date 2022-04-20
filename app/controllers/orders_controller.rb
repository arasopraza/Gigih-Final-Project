class OrdersController < ApplicationController
  def index
    @orders = Order.joins(:customer).select('customers.name as name, orders.total, orders.order_date')
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to @order
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private
  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:customer_id, :total, :order_date, :status)
  end
end
