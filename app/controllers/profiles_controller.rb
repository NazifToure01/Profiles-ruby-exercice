class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end
  def show
    @profile = Profile.find(params[:id])
  end

  def destroy
    @article = Profile.find(params[:id])
    @article.destroy
    redirect_to profiles_path(new)
    end
    def new
    @profile = Profile.new
  end
  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def profile_params
    params.require(:profile).permit(:firstname, :lastname, :description, :image)
  end
end
