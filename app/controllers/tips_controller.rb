class TipsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @tips = Tip.all    
  end

  def new
    @tip = Tip.new
  end

  def create
    current_user.tips.create(tip_params)
    redirect_to root_path
  end

  private

  def tip_params
    params.require(:tip).permit(:title, :description)
  end

end
