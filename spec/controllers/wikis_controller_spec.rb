require 'rails_helper'
require 'devise'

RSpec.describe WikisController, type: :controller do
  let(:my_user) { User.create!(email: "hlm2292@yahoo.com", password: "htest2")}
  let(:my_wiki) { Wiki.create!(title: "New Title", body: "New Body") }


  describe "GET #index" do

    before :example do
      sign_in my_user
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wiki] to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

  describe "GET #show" do

    it "returns http success" do
      get :show, params: {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: {id: my_wiki.id}
      expect(response).to render_template :show
    end

    it "assigns my_wiki to @wiki" do
      get :show, params: {id: my_wiki.id}
      expect(assigns(:wiki)).to eq(my_wiki)
    end
  end

  describe "GET #new" do

    it "returns http success" do
      get :new, params: {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, params: {id: my_wiki.id}
      expect(response).to render_template :new
    end

    it "instantiates @wiki" do
      get :new, params: {id: my_wiki.id}
      expect(assigns(:wiki)).not_to be_nil
    end
  end

  describe "GET #edit" do

    it "returns http success" do
      get :edit, params: {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: {id: my_wiki.id}
      expect(response).to render_template :edit
    end

    it "assigns wiki to be updated to @wiki" do
      get :edit, params: {id: my_wiki.id}

      wiki_instance = assigns(:wiki)

      expect(wiki_instance.id).to eq my_wiki.id
      expect(wiki_instance.title).to eq my_wiki.title
      expect(wiki_instance.body).to eq my_wiki.body
    end
  end

  describe "GET #create" do
    it "increases the number of Wiki by 1" do
      expect { post :create, wiki: {title: 'Wiki Test Title', body: 'Wiki Test Body'}}.to change(Wiki,:count).by(1)
    end

    it "assigns the new wiki to @wiki" do
      post :create, wiki: {title: 'Wiki Test Title', body: 'Wiki Test Body'}
      expect(assigns(:wiki)).to eq Wiki.last
    end

    it "redirects to the new wiki" do
      post :create, wiki: {title: 'Wiki Test Title', body: 'Wiki Test Body'}
      expect(response).to redirect_to Wiki.last
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "deletes the wiki" do
      delete :destroy, params: {id: my_wiki.id}
      count = Wiki.where({id: my_wiki.id}).size
      expect(count).to eq 0
    end

    it "redirects to wikis index" do
      delete :destroy, params: {id: my_wiki.id}
      expect(response).to redirect_to wikis_path
    end
  end

end
