module  Api
  module V1
    class UserCommentClapsController < ApplicationController
      skip_before_action :verify_authenticity_token
      def index
        user_comment_claps = UserCommentClap.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded comment claps', data:user_comment_claps},status: :ok
      end

      def show
        user_comment_claps = UserCommentClap.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded comment clap', data:user_comment_claps},status: :ok
      end


      def create
        user_comment_clap = UserCommentClap.new(user_comment_clap_params)
        # @user_comment_clap.user_comment_clap = current_user_comment_clap

        if user_comment_clap.save
          render json: {status: 'SUCCESS', message:'Saved user_comment_clap', data:user_comment_clap},status: :ok
        else
          render json: {status: 'ERROR', message:'user_comment_clap not saved', data:user_comment_clap.errors},status: :unprocessable_entity
        end
      end

      def destroy
        user_comment_clap = UserCommentClap.find(params[:id])
        user_comment_clap.destroy
        render json: {status: 'SUCCESS', message:'Deleted user_comment_clap', data:user_comment_clap},status: :ok
      end

      # def update
      #   user_comment_clap = UserCommentClap.find(params[:id])
      #   if user_comment_clap.update_attributes(user_comment_clap_params)
      #     render json: {status: 'SUCCESS', message:'Updated user_comment_clap', data:user_comment_clap},status: :ok
      #   else
      #     render json: {status: 'ERROR', message:'user_comment_clap not updated', data:user_comment_clap.errors},status: :unprocessable_entity
      #   end
      # end

      private

      def user_comment_clap_params
        params.permit(:user_id, :comment_id)
      end



    end
  end
end
