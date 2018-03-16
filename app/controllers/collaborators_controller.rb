class CollaboratorsController < ApplicationController

  def index
    @user = User.find(params[:email])
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = @wiki.collaborators
  end


  def create
    @user = User.find_by_email(params[:collaborator])
    @wiki = Wiki.find(params[:wiki_id])
    

    if @wiki.collaborators.exists?(user_id: @user.id)
      flash[:notice] = "User is already a collaborator."
      redirect_to edit_wiki_path(@wiki)
    else
      @collaborator = @wiki.collaborators.new(wiki_id: @wiki.id, user_id: @user.id)
    if @collaborator.save
      flash[:notice] = "New collaborator added to wiki."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error adding collaborator."
      redirect_to edit_wiki_path(@wiki)
    end
    end
  end



  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator has been removed from wiki"
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error removing collaborator."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end
