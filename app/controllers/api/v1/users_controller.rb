module  Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        users = User.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded users', data:users},status: :ok
      end

      def show
        users = User.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded user', data:users},status: :ok
      end

      def create
        user = User.new(user_params)
        # @user.user = current_user

        if user.save
          render json: {status: 'SUCCESS', message:'Saved user', data:user},status: :ok
        else
          render json: {status: 'ERROR', message:'user not saved', data:user.errors},status: :unprocessable_entity
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {status: 'SUCCESS', message:'Deleted user', data:user},status: :ok
      end

      def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
          render json: {status: 'SUCCESS', message:'Updated user', data:user},status: :ok
        else
          render json: {status: 'ERROR', message:'user not updated', data:user.errors},status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:name, :email, :title, :mobile, :password)
      end


    end
  end
end