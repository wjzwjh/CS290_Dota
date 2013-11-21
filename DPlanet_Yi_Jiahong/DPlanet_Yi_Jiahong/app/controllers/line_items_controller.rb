class LineItemsController < ApplicationController
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html{} # show.html.erb

      #format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    product_qty = params[:product_qty]
    check_out = params[:checkout]

    if product.quantity < product_qty.to_i
      logger.info('Quantity out of stock')
      #redirect_to(:back)
      redirect_to :back, :alert => product.id
      return
    end
    if check_out == 'true'
      product_qty_before = params[:qty_before]
      @line_item = @cart.update_product(product.id,product_qty)
      product.update_attributes(:quantity => product.quantity-(product_qty.to_i-product_qty_before.to_i))
      @line_item.product = product
    else

      @line_item = @cart.add_product(product.id,product_qty)
      product.update_attributes(:quantity => product.quantity-product_qty.to_i)
      @line_item.product = product
    end
    #@line_item = @cart.add_product(product.id)
    #@line_item.product = product


    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart }
        format.js   { @current_item = @line_item }
        format.json { render json: @line_item, status: :created, location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    logger.info('fuck line item')

      product = Product.find(@line_item.product_id)
      logger.info(product.quantity)

      product.update_attributes(:quantity => product.quantity+  @line_item.quantity)
    @line_item.destroy



    respond_to do |format|
      format.html { redirect_to @line_item.cart  }
      format.json { head :no_content }
    end
  end
end
