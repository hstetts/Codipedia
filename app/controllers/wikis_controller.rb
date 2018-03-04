class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]


  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def show
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    if @wiki.update(wiki_params)
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private

  def set_wiki
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def wiki_params
    params.require(:wiki).permit(:title, :body, )
  end
end
