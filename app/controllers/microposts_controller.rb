class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def show
    @micropost = Micropost.find_by id: params[:id]
    #@comment = @micropost.comments
  end

  def create
  	@micropost = current_user.microposts.build(microposts_params)
  	if @micropost.save
  	  flash[:success] = "Micropost created!"
  	  redirect_to root_url
  	else
      @feed_items = []
  	  render 'static_pages/home'
  	end
  end

  def destroy
  	@micropost.destroy
  	flash[:success] = "Micropost deleted!"
  	redirect_to request.referrer || root_url
  end

  def index
	  @microposts = Micropost.paginate(page: params[:page],:per_page => 10)
  end

  def edit
    @micropost = Micropost.find_by id: params[:id]
  end

  def update
    @micropost = Micropost.find_by id: params[:id]
    if @micropost.update_attributes(microposts_params)
      flash[:success] = "Update success!"
      redirect_to @micropost
      else
        render 'edit'
    end
  end

  private 
    def microposts_params
      params.require(:micropost).permit(:content, :picture)
    end
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
