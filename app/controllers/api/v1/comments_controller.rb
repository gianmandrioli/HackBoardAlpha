module  Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token
      def index
        comments = Comment.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded comments', data:comments},status: :ok
      end

      def show
        groups = Comment.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded comment', data:groups},status: :ok
      end

      def create
        comment = Comment.new(comment_params)
        # @comment.comment = current_comment

        if comment.save
          render json: {status: 'SUCCESS', message:'Saved comment', data:comment},status: :ok
        else
          render json: {status: 'ERROR', message:'comment not saved', data:comment.errors},status: :unprocessable_entity
        end
      end

      def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: {status: 'SUCCESS', message:'Deleted comment', data:comment},status: :ok
      end

      def update
        comment = Comment.find(params[:id])
        if comment.update_attributes(comment_params)
          render json: {status: 'SUCCESS', message:'Updated comment', data:comment},status: :ok
        else
          render json: {status: 'ERROR', message:'comment not updated', data:comment.errors},status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.permit(:user_id, :post_id, :text)
      end


    end
  end
end
