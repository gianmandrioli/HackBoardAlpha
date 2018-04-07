module  Api
  module V1
    class UserPostClapsController < ApplicationController
      skip_before_action :verify_authenticity_token
      def index
        user_post_claps = UserPostClap.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded post claps', data:user_post_claps},status: :ok
      end

      def show
        user_post_claps = UserPostClap.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded post clap', data:user_post_claps},status: :ok
      end

      def create
        user_post_clap = UserPostClap.new(user_post_clap_params)
        # @user_post_clap.user_post_clap = current_user_post_clap

        if user_post_clap.save
          render json: {status: 'SUCCESS', message:'Saved user_post_clap', data:user_post_clap},status: :ok
        else
          render json: {status: 'ERROR', message:'user_post_clap not saved', data:user_post_clap.errors},status: :unprocessable_entity
        end
      end

      def destroy
        user_post_clap = UserPostClap.find(params[:id])
        user_post_clap.destroy.first
        render json: {status: 'SUCCESS', message:'Deleted user_post_clap', data:user_post_clap},status: :ok
      end

      # def update
      #   user_post_clap = UserPostClap.find(params[:id])
      #   if user_post_clap.update_attributes(user_post_clap_params)
      #     render json: {status: 'SUCCESS', message:'Updated user_post_clap', data:user_post_clap},status: :ok
      #   else
      #     render json: {status: 'ERROR', message:'user_post_clap not updated', data:user_post_clap.errors},status: :unprocessable_entity
      #   end
      # end

      private

      def user_post_clap_params
        params.permit(:user_id, :comment_id)
      end


    end
  end
end
