class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :claps]
    before_action :set_group, only: [:index, :create]
    
    # GET /posts
    # GET /posts.json
    def index
        @user = current_user
        @groups = current_user.groups
        @group =  Group.find(params[:group_id])
        @posts = @group.posts.reverse
        @claps = UserPostClap.all
    end
    
    def search
        @posts = Post.search_by_user(params[:keywords], current_user)
    end
    
    def claps
        @clap = UserPostClap.create(user_id: current_user.id, post: @post )
        # @post = Post.new(post_params.merge!({user_id: current_user.id, group: @group}))
        # @post.user = current_user
        # @claps = UserPostClap.find_by(post_id: @post)
        if params[:favorites]
            redirect_to favorites_path
            return
            
        elsif params[:trending]
            redirect_to trending_path
            return
        elsif params[:show]
            redirect_to group_post_path
            return
        else
            redirect_to group_posts_path
        end
    end

    def unclap
        @user = current_user
        @groups = current_user.groups
        @group =  Group.find(params[:group_id])
        @posts = @group.posts
        @claps = UserPostClap.find(params[:id])
        # find all claps with this user id
        # last_clap = current_user.user_post_claps
        # puts last_clap
        puts "hereeeeeeee"
        # @clap = UserPostClap.where(id: [last_clap]).pluck(:id)
        puts @claps
        @claps.destroy
        if params[:favorites]
            redirect_to favorites_path
            return
            
        elsif params[:trending]
            redirect_to trending_path
            return
        elsif params[:show]
            redirect_to group_post_path
            return
        else
            redirect_to group_posts_path
        end
    end

     def upvote 
        # @post.upvote_from current_user
        @vote = ActsAsVotable::Vote.find_by(votable_type: "Post", votable_id: @post.id, voter_id: current_user.id)
        if !@vote
            current_user.likes @post
        else
            if(@vote.vote_flag)
                @vote.destroy
            else
                @vote.update(vote_flag: true)
            end
        end
        if params[:favorites]
            redirect_to favorites_path
        elsif params[:trending]
            redirect_to trending_path
        elsif params[:show]
            redirect_to group_post_path
        else
            redirect_to group_posts_path
        end
       
    end 

    def downvote
        @post.downvote_from current_user
        redirect_to group_posts_path

    end

    def trending
        @group =  Group.find_by(params[:id])
        @groups = current_user.groups
        # @trending = posts.all.sort_by{|post| post.user_post_claps.size}.reverse
        @posts = Post.all
        @claps = UserPostClap.all
    end

    def favorites
        @group =  Group.find_by(params[:id])
        @posts = Post.all
        @groups = current_user.groups
        @favorites = current_user.votes.up
        @claps = UserPostClap.all
    end
    # GET /posts/1
    # GET /posts/1.json
    def show
        @groups = current_user.groups
        @group =  Group.find(params[:group_id])
        @posts = @group.posts 
        @post = @posts.find_by(id: params[:id])   
        @comments = @post.comments
        @comment = Comment.new
        @claps = UserPostClap.all
        @claps_comment = UserCommentClap.all
   
    end
    
    # GET /posts/new
    def new
        @groups = current_user.groups
        @group =  Group.find(params[:group_id])
        @posts = @group.posts
        @post = Post.new
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
        # @post = @group.posts.build(post_params)
        @post = Post.new(post_params.merge!({user_id: current_user.id, group: @group}))
        # @post.user = current_user
    
        respond_to do |format|
        if @post.save
            format.html { redirect_to group_posts_path, notice: 'El post fue creado exitosamente' }
            format.json { render :show, status: :created, location: @post }
        else
            format.html { render :index }
            format.json { render json: @post.errors, status: :unprocessable_entity }
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
        def set_post
            @post = Post.find_by(id: params[:id])
            # @posts = @group.posts
        end
    
        def set_group
            @group = Group.find_by(id: params[:group_id])
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def post_params
            params.require(:post).permit(:title, :text, :category, :user_id)
        end
    end

