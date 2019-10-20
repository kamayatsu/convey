class FeelingsController < ApplicationController
  before_action :set_feeling, only: [:edit, :update, :destroy]
  def index
    @feelings = Feeling.all
  end

  def new
    @feeling = Feeling.new
  end

  def create
    @feeling = Feeling.new(feeling_params)
    if @feeling.save
      redirect_to root_path
    else
      redirect_to new_feeling_path
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_feeling
    @feeling = Feeling.find(params[:id])
  end

  def feeling_params
    params.require(:feeling).permit(:subject, :detail, :organization, :response).merge(user_id: current_user.id)
  end
end
