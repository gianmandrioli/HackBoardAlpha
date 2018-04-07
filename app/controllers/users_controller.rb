class UsersController < ApplicationController
    before_action :authenticate_user!
   
  

    def index
      @groups = current_user.groups
      @group =  Group.find(params[:group_id])
      @users = @group.users
    end

    def search
        @group =  Group.find_by(params[:id])
        @groups = current_user.groups
        @users = User.search_by_user(params[:keywords])
    end

    def edit
        @groups = current_user.groups
        @group =  1
        @user = current_user
    end


    def update
        @user = current_user
        respond_to do |format|
        if @user.update(user_params)
            format.html { redirect_to user_path(@user), notice: 'El empleado fue actualizado exitosamente.' }
            format.json { render :show, status: :ok, location: @post }
        else
            format.html { render :edit }
            format.json { render json: @post.errors, status: :unprocessable_entity }
        end
        end
    end

    def show 
        @groups = current_user.groups
        @group =  Group.first
        @user = current_user

    end



private

   

    def user_params
        params.require(:user).permit(:name, :email, :title, :mobile, :avatar)
    end



end
