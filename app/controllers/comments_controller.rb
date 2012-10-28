class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
      @user = User.find(params[:user_id])
   
      @tagged = params[:tag]
      
      if @tagged
          @comments = Comment.where(:status => 1)
      else
          @comments = Comment.where(:status => nil)
      end
      
      x,@commenter,@com_id = 0,[],[]
      @comments.each do |comment|
          commter = User.where(:id => comment.user_id)
          com, comid = commter.pluck(:name), commter.pluck(:id)
          @commenter[x] = com[0]
          @com_id[x] = comid[0].to_i
          
          x += 1
        end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end
    
    def markcomp
        @user = User.find(params[:user_id])
        @comment = Comment.find(params[:id])
        
        if @comment.update_attributes(:status => 1)
            redirect_to user_comments_path(@user.id) , notice: 'Comment marked complete'
        end
    end
  # GET /comments/new
  # GET /comments/new.json
  def new
      @user = User.find(params[:user_id])
      @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
      @user = User.find(params[:user_id])
    @comment = @user.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_path(@user.id), notice: 'Your comment has been submitted' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
