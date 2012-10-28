class ComparisonsController < ApplicationController
  # GET /comparisons
  # GET /comparisons.json
  def index
      @user = User.find(params[:user_id])
      @comparisons = Comparison.where(:user_id => @user.id)
      
      x,@name,@brand,@dimension,@weight,@price = 0,[],[],[],[],[]
      @comparisons.each do |comp|
          product = Product.where(:id => comp.product_id)
          name = product.pluck(:name)
          brand = product.pluck(:brand)
          dimension = product.pluck(:dimensions)
          weight = product.pluck(:weight)
          price = product.pluck(:price)
          @name[x],@brand[x],@dimension[x],@weight[x],@price[x] = name[0],brand[0],dimension[0],weight[0],price[0]
          
          x += 1
        end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comparisons }
    end
  end

  # GET /comparisons/1
  # GET /comparisons/1.json
  def show
    @comparison = Comparison.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comparison }
    end
  end

  # GET /comparisons/new
  # GET /comparisons/new.json
  def new
    @comparison = Comparison.new
      @user = User.find(params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comparison }
    end
  end

  # GET /comparisons/1/edit
  def edit
    @comparison = Comparison.find(params[:id])
  end

  # POST /comparisons
  # POST /comparisons.json
  def create
      @user = User.find(params[:user_id])
      @product = Product.find(params[:product_id])
      
    @comparison = @user.comparisons.build(:product_id => @product.id)

    respond_to do |format|
      if @comparison.save
        format.html { redirect_to @user, notice: 'Item has been added to your comparison list.' }
        format.json { render json: @comparison, status: :created, location: @comparison }
      else
        format.html { render action: "new" }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comparisons/1
  # PUT /comparisons/1.json
  def update
    @comparison = Comparison.find(params[:id])

    respond_to do |format|
      if @comparison.update_attributes(params[:comparison])
        format.html { redirect_to @comparison, notice: 'Comparison was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comparisons/1
  # DELETE /comparisons/1.json
  def destroy
      @user = User.find(params[:user_id])
    @comparison = Comparison.find(params[:id])
    @comparison.destroy

    respond_to do |format|
      format.html { redirect_to user_comparisons_path(@user.id), notice: 'Item was removed from list' }
      format.json { head :no_content }
    end
  end
end
