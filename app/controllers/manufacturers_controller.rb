class ManufacturersController < ApplicationController
  # GET /manufacturers
  # GET /manufacturers.json
  def index
    @manufacturers = Manufacturer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manufacturers }
    end
  end

  # GET /manufacturers/1
  # GET /manufacturers/1.json
  def show
    @manufacturer = Manufacturer.find(params[:id])
      @products = Product.where(:manufacturer_id => @manufacturer.id)
      @verification = Verification.where(:manufacturer_id => @manufacturer.id)
      @vstat = @verification.pluck(:status)
      @vstat = @vstat[0].to_i
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manufacturer }
    end
  end

  # GET /manufacturers/new
  # GET /manufacturers/new.json
  def new
    @manufacturer = Manufacturer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manufacturer }
    end
  end

  # GET /manufacturers/1/edit
  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  # POST /manufacturers
  # POST /manufacturers.json
  def create
    @manufacturer = Manufacturer.new(params[:manufacturer])

    respond_to do |format|
      if @manufacturer.save
          masign_in @manufacturer
        format.html { redirect_to @manufacturer, notice: 'Manufacturer was successfully created.' }
        format.json { render json: @manufacturer, status: :created, location: @manufacturer }
      else
        format.html { render action: "new" }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manufacturers/1
  # PUT /manufacturers/1.json
  def update
    @manufacturer = Manufacturer.find(params[:id])

    respond_to do |format|
      if @manufacturer.update_attributes(params[:manufacturer])
        format.html { redirect_to @manufacturer, notice: 'Manufacturer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

def veri
    @manufacturer = Manufacturer.find(params[:id])
    #@tag = params[:tag]
    #@puts "the tag is #{@tag.to_i.class}"
    if Verification.create(:manufacturer_id => @manufacturer.id, :status => 1)
        redirect_to @manufacturer, notice: 'Verification has been requested'
    else 
        redirect_to @manufacturer, notice: 'something went wrong'

    end
end
    
  # DELETE /manufacturers/1
  # DELETE /manufacturers/1.json
  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy

    respond_to do |format|
      format.html { redirect_to manufacturers_url }
      format.json { head :no_content }
    end
  end
end
