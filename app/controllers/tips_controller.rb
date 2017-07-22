class TipsController < ApplicationController

  def index
    @tips = Tip.all    
  end

  def new
    @tip = Tip.new
  end

  def create
    Tip.create(tip_params)
    redirect_to root_path
  end

  private

  def tip_params
    params.require(:tip).permit(:title, :description)
  end

end
