class ClientsController < ApplicationController
  
  respond_to :html

  def new
    @client = user.clients.new

    respond_with [user, @client]
  end

  def create
    @client = user.clients.new(params[:client])
    new_was_succesful = @client.save

    respond_with [user, @client] do |format|
      format.html {
        if new_was_succesful 
          redirect_to(user_path(user),:notice => 'The Client was created.')
        else
          render 'new'
        end
      }
    end 
  end

  def edit 
    @client = user.clients.find(params[:id])

    respond_with [user, @client]
  end

  def update
    @client = user.clients.find(params[:id])
    update_was_succesful = @client.update_attributes(params[:client])

    respond_with [user, @client] do |format|
      format.html {
        if update_was_succesful 
          redirect_to(user_path(user),:notice => 'The Client was saved.')
        else
          render 'edit'
        end
      }
    end 
  end

  def destroy
    @client = user.clients.find(params[:id])

    if @client.destroy
      flash[:notice] = "The client was destroyed."
    else
      flash[:alert] = "The client can't be destroyed."
    end 

    respond_with [user, @client] do |format|
      format.html {
          redirect_to(user_path(user))
      }
    end 
  end 

  private
  def user
    @user ||= User.find(params[:user_id])
  end
end