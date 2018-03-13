class CollaboratorsController < ApplicationController

  def index
    @user = User.find(params[:email])
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = @wiki.collaborators
  end


  def create
    @user = User.find_by_email(params[:collaborator])
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.new(wiki_id: @wiki.id, user_id: @user.id)
    if @collaborator.save
         flash[:notice] = "New collaborator added to wiki."
     else
      flash[:error] = "There was an error adding collaborator."
    end
  redirect_to @wiki
  end


  def destroy
  end
end
