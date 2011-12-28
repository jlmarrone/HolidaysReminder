class HolidaysController < ApplicationController
 
 respond_to :html

  def new
    @holiday = user.holidays.new

    respond_with [user, @holiday]
  end

  def create
    @holiday = user.holidays.new(params[:holiday])
    new_was_succesful = @holiday.save

    respond_with [user, @holiday] do |format|
      format.html {
        if new_was_succesful 
          redirect_to(user_path(user),:notice => 'The Holiday was created.')
        else
          render 'new'
        end
      }
    end 
  end

  def edit 
    @holiday = user.holidays.find(params[:id])

    respond_with [user, @holiday]
  end

  def update
    @holiday = user.holidays.find(params[:id])
    update_was_succesful = @holiday.update_attributes(params[:holiday])

    respond_with [user, @holiday] do |format|
      format.html {
        if update_was_succesful 
          redirect_to(user_path(user),:notice => 'The Holiday was saved.')
        else
          render 'edit'
        end
      }
    end 
  end

  def destroy
    @holiday = user.holidays.find(params[:id])

    if @holiday.destroy
      flash[:notice] = "The holiday was destroyed."
    else
      flash[:alert] = "The holiday can't be destroyed."
    end 

    respond_with [user, @holiday] do |format|
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