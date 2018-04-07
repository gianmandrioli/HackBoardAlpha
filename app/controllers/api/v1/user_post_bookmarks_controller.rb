module  Api
  module V1
    class UserPostBookmarksController < ApplicationController
      skip_before_action :verify_authenticity_token
      def index
        # user_post_bookmarks = current_user.votes.up
        user_post_bookmarks = UserPostBookmark.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded bookmarks', data:user_post_bookmarks},status: :ok
      end

      def show
        user_post_bookmarks = current_user.votes.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded bookmark', data:user_post_bookmarks},status: :ok
      end

      
    end
  end
end
