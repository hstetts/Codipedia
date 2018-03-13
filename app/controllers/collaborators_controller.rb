class CollaboratorsController < ApplicationController

  def index
    @users = User.all
    @wiki = Wiki.find(params[:wiki_id])
  end


  def create
    @user = User.find(params[:user_id])
    @wiki = Wiki.find(params[:wiki_id])
  end

  def destroy
  end
end
