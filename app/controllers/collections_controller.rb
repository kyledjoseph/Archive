class CollectionsController < ApplicationController
  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collections }
    end
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    @collection = Collection.find(params[:id])
      @collect = Myitem.where(:user_id => @collection.user_id, :collection => @collection.name)
        x,@collection_items = 0,[]
      @collect.each do |item|
          @product = Product.where(:id => item.product_id)
          @colt= @product.pluck(:name)
          @collection_items[x] = @colt[0]
          
          x += 1
          end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collection }
    end
  end

  # GET /collections/new
  # GET /collections/new.json
  def new
    @collection = Collection.new
      @user = User.find(params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collection }
    end
  end

  # GET /collections/1/edit
  def edit
    @collection = Collection.find(params[:id])
      @user = User.find(params[:user_id])

  end

  # POST /collections
  # POST /collections.json
  def create
      @user = User.find(params[:user_id])
      
      #@product = Product.find(params[:product_id])
      
      @collection = @user.collections.build(params[:collection])

    respond_to do |format|
      if @collection.save
        format.html { redirect_to user_path(@user.id), notice: 'Collection was successfully created.' }
        format.json { render json: @collection, status: :created, location: @collection }
      else
        format.html { render action: "new" }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /collections/1
  # PUT /collections/1.json
  def update
    @collection = Collection.find(params[:id])
      @user = User.find(params[:user_id])

    respond_to do |format|
      if @collection.update_attributes(params[:collection])
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
      @user = User.find(params[:user_id])

    respond_to do |format|
      format.html { redirect_to collections_url }
      format.json { head :no_content }
    end
  end
end
