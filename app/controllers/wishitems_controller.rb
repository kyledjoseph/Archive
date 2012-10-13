class WishitemsController < ApplicationController
  # GET /wishitems
  # GET /wishitems.json
  def index
    @wishitems = Wishitem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wishitems }
    end
  end

  # GET /wishitems/1
  # GET /wishitems/1.json
  def show
    @wishitem = Wishitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wishitem }
    end
  end

  # GET /wishitems/new
  # GET /wishitems/new.json
  def new
    @wishitem = Wishitem.new
      @user = User.find(params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wishitem }
    end
  end

  # GET /wishitems/1/edit
  def edit
    @wishitem = Wishitem.find(params[:id])
  end

  # POST /wishitems
  # POST /wishitems.json
  def create
       @user = User.find(params[:user_id])
      @product = Product.find(params[:product_id])
      
      @wishitem = @user.wishitems.build(:product_id => @product.id)

    respond_to do |format|
      if @wishitem.save
        format.html { redirect_to products_path, notice: 'Item was successfully added to wishlist.' }
        format.json { render json: @user, status: :created, location: @wishitem }
      else
        format.html { render action: "new" }
        format.json { render json: @wishitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wishitems/1
  # PUT /wishitems/1.json
  def update
    @wishitem = Wishitem.find(params[:id])

    respond_to do |format|
      if @wishitem.update_attributes(params[:wishitem])
        format.html { redirect_to @wishitem, notice: 'Wishitem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wishitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishitems/1
  # DELETE /wishitems/1.json
  def destroy
    @wishitem = Wishitem.find(params[:id])
    @wishitem.destroy

    respond_to do |format|
      format.html { redirect_to wishitems_url }
      format.json { head :no_content }
    end
  end
end
