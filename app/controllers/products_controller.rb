class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    if params[:manufacturer_id]
        @products = Product.where(:manufacturer_id => params[:manufacturer_id])
    elsif params[:retailer_id]
        @products = Product.where(:retailer_id => params[:retailer_id])
    end
      #@user = User.find(session[:user_id])
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
    
    #GET /products/search
    def search
        @products = Product.search(params[:search])
        
        @prod = Product.where(:name => params[:search])
        @product = @prod.pluck(:id)
        @product = @product[0].to_i
        if !(@product == 0)
        redirect_to product_path(@product)
        end
        end

  # GET /products/1
  # GET /products/1.json
  def show
      if !(macurrent_user || recurrent_user)
      @user = User.find(session[:user_id])
          end
    @product = Product.find(params[:id])
      #@comparison = Comparison.where(:product_id => @product.id)
      @reviews = Review.where(:product_id => @product.id)
      x,@poster = 0,[]
      @reviews.each do |poster|
          person = poster.user_id
          person = User.where(:id => person)
          person = person.pluck(:name)
          @poster[x] = person[0]
          
          x += 1
        end
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
      x, @category = 0,[]
       @cat = Category.all
      @cat.each do |cate|
          @category[x] = cate.name
          
          x += 1
      end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
     
      

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
