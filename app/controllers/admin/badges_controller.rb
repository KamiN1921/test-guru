class Admin::BadgesController < Admin::BaseController

  before_action :set_badges, only: :index
  before_action :set_badge, only: %i[show edit update destroy]

  def index
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badges_params)

    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @badge.update(badges_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    if @badge.destroy
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_badges
    @badges = Badge.all
  end

  def badges_params
    params.require(:badge).permit(:title, :file, :rule)
  end
end