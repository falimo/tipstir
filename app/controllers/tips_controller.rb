class TipsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]


  def index
    @tips = Tip.all    
  end

  def new
    @tip = Tip.new
  end

  def create
    @tip = current_user.tips.create(tip_params)
    if @tip.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tip = Tip.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @tip = Tip.find(params[:id])

    if @tip.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @tip.destroy
    redirect_to root_path
  end

  private

  def tip_params
    params.require(:tip).permit(:title, :description)
  end

end
