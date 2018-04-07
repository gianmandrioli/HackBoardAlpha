class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment, only: [:show, :edit, :update, :destroy, :claps]
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :set_group, only: [:index, :create]
    
    # GET /posts
    # GET /posts.json
    def index
        @user = current_user
        @groups = current_user.groups
        @group =  Group.find(params[:group_id])
        @posts = @group.posts.reverse
        
    end
    
    def claps
        @clap = UserCommentClap.new(user_id: current_user.id, comment_id: params[:comment_id] )
        # @post = Post.new(post_params.merge!({user_id: current_user.id, group: @group}))
        # @post.user = current_user
        respond_to do |format|
        if @clap.save
            format.html { redirect_to group_post_path }
            format.json { render :show, status: :created, location: @claps }
        else
            format.html { render :index }
            format.json { render json: @post.errors, status: :unprocessable_entity }
        end
        end
        # @claps = UserPostClap.find_by(post_id: @post)
    end
    
    # GET /posts/1
    # GET /posts/1.json
    def show
        @groups = current_user.groups
        @group =  Group.find(params[:group_id])
        @posts = @group.posts 
        @post = @posts.find_by(id: params[:id])       
    end
    
    # GET /posts/new
    def new
        @groups = current_user.groups
        @group =  Group.find(params[:group_id])
        @posts = @group.posts
        @comment = Comment.new
    end
    
    # GET /posts/1/edit
    def edit
        @groups = current_user.groups
        @group =  Group.find(params[:group_id])
        @posts = @group.posts 
        @post = @posts.find_by(id: params[:id])
    end
    
    # POST /posts
    # POST /posts.json
    def create
        @groups = current_user.groups
        @group =  Group.find(params[:group_id])
        @posts = @group.posts
        @post = Post.find_by(id: params[:post_id])
        # @post = @group.posts.build(post_params)
        @comment = Comment.new(post_params.merge!({user_id: current_user.id, post: @post}))
        # @post.user = current_user
    
        respond_to do |format|
            if @comment.save
                format.html { redirect_to group_post_path(@group ,@post), notice: 'El post fue creado exitosamente' }
                format.json { render :show, status: :created, location: @comment }
            else
                format.html { render :index }
                format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # PATCH/PUT /posts/1
    # PATCH/PUT /posts/1.json
    def update
        respond_to do |format|
        if @post.update(post_params)
            format.html { redirect_to group_posts_path(params[:group_id]), notice: 'El empleado fue actualizado exitosamente.' }
            format.json { render :show, status: :ok, location: @post }
        else
            format.html { render :edit }
            format.json { render json: @post.errors, status: :unprocessable_entity }
        end
        end
    end
    
    # DELETE /posts/1
    # DELETE /posts/1.json
    def destroy
        @post.destroy
        respond_to do |format|
        format.html { redirect_to group_posts_path, notice: 'El empleado fue eliminado exitosamente.' }
        format.json { head :no_content }
        end
    end
    
    private
        # Use callbacks to share common setup or constraints between actions.

        def set_comment
            @comment = Comment.find_by(id: params[:id])
            # @posts = @group.posts
        end
        def set_post
            @post = Post.find_by(id: params[:id])
            # @posts = @group.posts
        end
    
        def set_group
            @group = Group.find_by(id: params[:group_id])
        end
        
        def coment_params
            params.require(:comment).permit(:text)
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def post_params
            params.require(:comment).permit(:text)
        end

end
