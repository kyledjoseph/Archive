class RetailersController < ApplicationController
  # GET /retailers
  # GET /retailers.json
  def index
    @retailers = Retailer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @retailers }
    end
  end

  # GET /retailers/1
  # GET /retailers/1.json
  def show
    @retailer = Retailer.find(params[:id])
    @products = Product.where(:retailer_id => @retailer.id)
      
      @verification = Verification.where(:retailer_id => @retailer.id)
      @vstat = @verification.pluck(:status)
      @vstat = @vstat[0].to_i
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @retailer }
    end
  end

  # GET /retailers/new
  # GET /retailers/new.json
  def new
    @retailer = Retailer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @retailer }
    end
  end

  # GET /retailers/1/edit
  def edit
    @retailer = Retailer.find(params[:id])
  end

  # POST /retailers
  # POST /retailers.json
  def create
    @retailer = Retailer.new(params[:retailer])

    respond_to do |format|
      if @retailer.save
          resign_in @retailer
        format.html { redirect_to @retailer, notice: 'Retailer was successfully created.' }
        format.json { render json: @retailer, status: :created, location: @retailer }
      else
        format.html { render action: "new" }
        format.json { render json: @retailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /retailers/1
  # PUT /retailers/1.json
  def update
    @retailer = Retailer.find(params[:id])

    respond_to do |format|
      if @retailer.update_attributes(params[:retailer])
        format.html { redirect_to @retailer, notice: 'Retailer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @retailer.errors, status: :unprocessable_entity }
      end
    end
  end
    
    def veri
        @retailer = Retailer.find(params[:id])
        #@tag = params[:tag]
        #@puts "the tag is #{@tag.to_i.class}"
        if Verification.create(:retailer_id => @retailer.id, :status => 1)
            redirect_to @retailer, notice: 'Verification has been requested'
        else 
            redirect_to @retailer, notice: 'something went wrong'
        end
    end

  # DELETE /retailers/1
  # DELETE /retailers/1.json
  def destroy
    @retailer = Retailer.find(params[:id])
    @retailer.destroy

    respond_to do |format|
      format.html { redirect_to retailers_url }
      format.json { head :no_content }
    end
  end
end
