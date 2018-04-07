module  Api
  module V1
    class GroupsController < ApplicationController
      # skip_before_action :authenticate_user!, raise: false
      skip_before_action :verify_authenticity_token
      def index
        groups = Group.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded groups', data:groups},status: :ok
      end

      def show
        groups = Group.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded Group', data:groups},status: :ok
      end

      def create
        group = Group.new(group_params)
        # @group.user = current_user

        if group.save
          render json: {status: 'SUCCESS', message:'Saved Group', data:group},status: :ok
        else
          render json: {status: 'ERROR', message:'Group not saved', data:group.errors},status: :unprocessable_entity
        end
      end

      def destroy
        group = Group.find(params[:id])
        group.destroy
        render json: {status: 'SUCCESS', message:'Deleted Group', data:group},status: :ok
      end

      def update
        group = Group.find(params[:id])
        if group.update_attributes(group_params)
          render json: {status: 'SUCCESS', message:'Updated Group', data:group},status: :ok
        else
          render json: {status: 'ERROR', message:'Group not updated', data:group.errors},status: :unprocessable_entity
        end
      end

      private

      def group_params
        params.permit(:name, :user_id)
      end

    end
  end
end
