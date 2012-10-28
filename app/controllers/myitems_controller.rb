class MyitemsController < ApplicationController
  # GET /myitems
  # GET /myitems.json
  def index
    @myitems = Myitem.all
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @myitems }
    end
  end

  # GET /myitems/1
  # GET /myitems/1.json
  def show
    @myitem = Myitem.find(params[:id])
       @user = User.find(params[:user_id])
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @myitem }
    end
  end

  # GET /myitems/new
  # GET /myitems/new.json
  def new
    @myitem = Myitem.new
      @user = User.find(params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @myitem }
    end
  end

  # GET /myitems/1/edit
  def edit
    @myitem = Myitem.find(params[:id])
      @user = User.find(params[:user_id])
      @collect = Collection.where(:user_id => @user.id)
      x,@collections = 0,[]
      @collect.each do |collection|
          
          @collections[x] = collection.name
        x += 1
    end
      
  end

  # POST /myitems
  # POST /myitems.json
  def create
      @user = User.find(params[:user_id])
      
      @product = Product.find(params[:product_id])
      
      @myitem = @user.myitems.build(:product_id => @product.id)
      
    respond_to do |format|
      if @myitem.save
        format.html { redirect_to user_path(@user.id), notice: 'item was added successfully.' }
        format.json { render json: @myitem, status: :created, location: @myitem }
      else
        format.html { render action: "new" }
        format.json { render json: @myitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /myitems/1
  # PUT /myitems/1.json
  def update
      @myitem = Myitem.find(params[:id])
      @user = User.find(params[:user_id])
        
      
    respond_to do |format|
      if @myitem.update_attributes(params[:myitem])
        format.html { redirect_to user_myitem_path(@user.id, @myitem.id), notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @myitem.errors, status: :unprocessable_entity }
      end
    end
  end

def remcol
    @user = User.find(params[:user_id])
    
    @myitem =  Myitem.find(params[:id])
    
    
    if params[:tag]
        
        if @myitem.update_attributes(:collection => nil)
            redirect_to @user, notice: 'item was removed from collection'
        end
        
    end
    
end
        
        
  # DELETE /myitems/1
  # DELETE /myitems/1.json
  def destroy
    @myitem = Myitem.find(params[:id])
      @user = User.find(params[:user_id])
    @myitem.destroy

    respond_to do |format|
      format.html { redirect_to @user, notice: 'Item has been deleted' }
      format.json { head :no_content }
    end
  end
end
