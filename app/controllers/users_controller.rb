class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy, :edit]

  def index
    @users = User.all
  end

  def show
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
  end

  def new
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
