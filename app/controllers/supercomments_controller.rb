class SupercommentsController < ApplicationController
  # GET /supercomments
  # GET /supercomments.json
  def index
      
      @supercomments = Supercomment.where(:status => params[:tag])
      @tag = params[:tag]
      

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supercomments }
    end
  end

  # GET /supercomments/1
  # GET /supercomments/1.json
  def show
    @supercomment = Supercomment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supercomment }
    end
  end

  # GET /supercomments/new
  # GET /supercomments/new.json
  def new
    @supercomment = Supercomment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supercomment }
    end
  end

  # GET /supercomments/1/edit
  def edit
    @supercomment = Supercomment.find(params[:id])
  end

  # POST /supercomments
  # POST /supercomments.json
  def create
    @supercomment = Supercomment.new(params[:supercomment])
    if macurrent_user
          @creator = Manufacturer.find([macurrent_user.id])
    elsif recurrent_user
          @creator = Retailer.find([recurrent_user.id])
    end
    respond_to do |format|
      if @supercomment.save
        format.html { redirect_to @creator, notice: 'Your comment has been sent to our admins' }
        format.json { render json: @supercomment, status: :created, location: @supercomment }
      else
        format.html { render action: "new" }
        format.json { render json: @supercomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /supercomments/1
  # PUT /supercomments/1.json
  def update
    @supercomment = Supercomment.find(params[:id])

    respond_to do |format|
      if @supercomment.update_attributes(params[:supercomment])
        format.html { redirect_to @supercomment, notice: 'Supercomment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supercomment.errors, status: :unprocessable_entity }
      end
    end
  end
    
def markcomp
    @supercomment = Supercomment.find(params[:id])
    if params[:tag].to_i == 1
        if @supercomment.update_attributes(:status => 2)
            redirect_to supercomments_path(:tag => 1), notice: 'Comment was successfully marked complete.'
        end
    elsif params[:tag].to_i == 3
        if @supercomment.update_attributes(:status => 4)
            redirect_to supercomments_path(:tag => 3), notice: 'Comment was successfully marked complete.'
        end
    end
    
end

  # DELETE /supercomments/1
  # DELETE /supercomments/1.json
  def destroy
    @supercomment = Supercomment.find(params[:id])
    @supercomment.destroy

    respond_to do |format|
      format.html { redirect_to supercomments_url }
      format.json { head :no_content }
    end
  end
end
