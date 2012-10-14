class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
      @user = User.find(session[:user_id])
      if !@user.admin.nil?

        else
          redirect_to root_path, notice: 'Access Restricted'
      end
  end
    
    def admin
        @user = User.find(params[:id])
        if !@user.admin.nil?
            @users = User.all
            @products = Product.all
            @categories = Category.all
            
            
            
        respond_to do |format|
            format.html # admin.html.erb
            format.json 
        end
        else
            redirect_to root_path, notice: 'Access Restricted'
        end
    end
    
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
      
       @wishitem = Wishitem.where(:user_id => @user.id)
      x,@prod,@product = 0,[],[]
      @wishitem.each do |item|
          @prod[x] = item.product_id
          @product[x] = Product.where( :id => @prod[x])
          
          x += 1
      end
      
      @myitem = Myitem.where(:user_id => @user.id)
      n,@ite,@itep,@ritep = 0,[],[],[]
      @myitem.each do |item|
          #@ite[n] = item.product_id
          @ritep[n] = item.id
          @itep[n] = Product.where( :id => @prod[n])
          
          n += 1
      end
      
       @collection = Collection.where(:user_id => @user.id)
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
          sign_in @user

        format.html { redirect_to @user, notice: 'Account was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
      @superuser = User.find(session[:user_id])
      
      if !@superuser.admin.nil? 
          
              if @user.update_attributes(:admin => 1)
                   redirect_to users_path, notice: 'User was successfully upgraded to admin.' 
                
              end
        end
          
    
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
